#!/usr/bin/env python
# encoding: utf-8
"""
Translate CSV files into MySQL tables.
Borrowed a good bit of code from this project https://github.com/maxhodak/csv2sql
"""

import MySQLdb
import csv
import argparse
import getpass


class Csv2MySQL(object):

    def __init__(self, filename, database, table, db_host, db_user, password):
        super(Csv2MySQL, self).__init__()

        self.database = database
        self.table = table
        self.db_host = db_host
        self.db_user = db_user
        self.password = password

        self.filename = filename
        self.csvfile = open(filename)
        self.dialect = csv.Sniffer().sniff(self.csvfile.read(128))
        self.csvfile.seek(0)

        self.csvreader = csv.reader(self.csvfile, self.dialect)
        self.headers = self.csvreader.next()
        self.headers = [header.split(':')[0][:64] for header in self.headers]
        self.types = dict([(header, 'BIGINT') for header in self.headers])

    def _get_mysql_conn(self):
        return MySQLdb.connect(host=self.db_host,
                               port=3306,
                               user=self.db_user,
                               db=self.database,
                               passwd=self.password)

    def isFloat(self, x):
        try:
            float(x)
            return True
        except ValueError:
            return False

    def isInteger(self, x):
        if x == '' or x is None:
            return True
        try:
            int(x)
            return True
        except:
            return False

    def generate(self):
        for row in self.csvreader:
            for i, header in enumerate(self.headers):
                col = row[i]

                if self.types[header] == 'BIGINT':
                    if not self.isInteger(col):
                        self.types[header] = 'DOUBLE'
                if self.types[header] == 'DOUBLE':
                    if not self.isFloat(col):
                        self.types[header] = 'VARCHAR(255)'
                if self.types[header] == 'VARCHAR(255)':
                    if len(col) > 255:
                        self.types[header] = 'TEXT'

    def create_table(self):
        sql = "CREATE TABLE IF NOT EXISTS `{0}`.`{1}` (\n".format(self.database, self.table)
        for header in self.headers:
            sql = sql + "  `{0}` \t {1},\n".format(header, self.types[header])
        sql = sql[:-2]
        sql += "\n);"

        with self._get_mysql_conn() as cur:
            cur.execute(sql)

    def insert_data(self):
        self.csvfile.seek(0)
        self.csvreader = csv.reader(self.csvfile, self.dialect)
        self.csvreader.next()

        batch_size = 1000
        sql = "INSERT INTO `{0}`.`{1}` VALUES ".format(self.database, self.table)
        i = 0
        while True:
            row = next(self.csvreader, None)

            if (i % batch_size == 0 and i > 0) or row is None:
                sql = sql[:-1] + ";"
                with self._get_mysql_conn() as cur:
                    try:
                        cur.execute(sql)
                    except Exception as e:
                        print "FAILED loading data into MySQL with: {0}".format(str(e))
                        print sql + "\n\n"

                sql = "INSERT INTO `{0}`.`{1}` VALUES ".format(self.database, self.table)
                print "inserted {0} rows in {1}.{2}".format(i, self.database, self.table)
                if row is None:
                    break

            # Build INSERT statement
            sql += '('
            for col in row:
                col_str = 'NULL,' if col == '' else "'{0}',".format(col.replace('"', '\"').replace("'", "\\'"))
                sql += col_str
            sql = sql[:-1] + "),"

            i += 1


def args():
    parser = argparse.ArgumentParser(description="Load CSV dataset into MySQL table.")
    parser.add_argument('csv_file', help='CSV file path', type=str)
    parser.add_argument('database', help='MySQL database', type=str)
    parser.add_argument('db_table', help='MySQL table to create', type=str)
    parser.add_argument('db_host', help='DB host', type=str)
    parser.add_argument('db_user', help='DB user', type=str)
    return parser.parse_args()


def main():
    a = args()

    # Get PW input from user
    pw = getpass.getpass("Please enter password for {0}: ".format(a.db_user))

    # Create object for translating CSV to SQL creation statements
    csv2mysql = Csv2MySQL(a.csv_file, a.database, a.db_table, a.db_host, a.db_user, pw)

    print "Inferring column types..."
    csv2mysql.generate()

    print "Creating MySQL table..."
    csv2mysql.create_table()

    print "Inserting CSV data to MySQL table..."
    csv2mysql.insert_data()


if __name__ == '__main__':
    main()

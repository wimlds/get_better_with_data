import MySQLdb
import getpass


def main():
    db_user = 'data_hacker'

    # Get PW input from user
    pw = getpass.getpass("Please enter password for {0}: ".format(db_user))

    # Setup MySQL connection
    conn = MySQLdb.connect(host='health-db-internet.c6clocfz5zxy.us-east-1.rds.amazonaws.com',
                           port=3306,
                           user=db_user,
                           passwd=pw)
    cur = conn.cursor()

    # Execute query
    query = 'SELECT * FROM CMS_open_payments_2013.general_payment_data WHERE Recipient_State="WY"'
    print 'Running query:  {0};\n'.format(query)
    cur.execute(query)

    wyoming_data = cur.fetchall()
    print 'Columns:  {0}\n'.format([c[0] for c in cur.description])
    print 'Number of records: {0}'.format(len(wyoming_data))

    # Close MySQL connections
    cur.close()
    conn.close()

if __name__ == '__main__':
    main()

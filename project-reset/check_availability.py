"""
NoAds X Files "Project Reset"
GSolone (2022) for NoAds.it
---------------------------------------------------------------------------------------------------------
Credits:
    https://pyfunceble.readthedocs.io/en/dev/usage/index.html#check-the-availability-of-an-ip-or-domain
    https://www.geeksforgeeks.org/python-removing-newline-character-from-string/
    https://www.pythontutorial.net/python-basics/python-write-csv-file/
"""

from PyFunceble import DomainAndIPAvailabilityChecker
import csv
import os

def check_availability_csv(source,destination):
    destfile = open(destination, 'w')
    csvheader = ['source', 'availability']
    writer = csv.writer(destfile)
    writer.writerow(csvheader)
    with open(source, 'r') as f:
        for domain in f:
            status = checker.set_subject(domain).get_status()
            status_dict = status.to_dict()
            print("{}: {}".format(domain.strip(),status_dict['status']))
            csvrow = [domain.strip(), status_dict['status']]
            writer.writerow(csvrow)
        destfile.close()

def check_availability_txt(source,destination):
    destfile = open(destination, 'w')
    with open(source, 'r') as f:
        for domain in f:
            status = checker.set_subject(domain).get_status()
            status_dict = status.to_dict()
            print("{}: {}".format(domain.strip(),status_dict['status']))
            if (status_dict['status'] == 'INACTIVE'):
                destfile.write(domain)
        destfile.close()

checker = DomainAndIPAvailabilityChecker()
#check_availability_csv('sourcelist.csv','check_availability.csv') # Save to CSV
check_availability_txt('sourcelist.csv','inactive.txt') # Save to text file (inactive only)

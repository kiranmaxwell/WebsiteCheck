import time
import requests

def check_connectivity():
    with open('websites.txt', 'r') as file:
        websites = file.readlines()
    
    for website in websites:
        website = website.strip()
        if website:
            try:
                response = requests.get(website)
                if response.status_code == 200:
                    print(f"{website} is reachable.")
                else:
                    print(f"{website} returned status code {response.status_code}.")
            except requests.RequestException as e:
                print(f"{website} is unreachable. Error: {e}")

if __name__ == "__main__":
    while True:
        check_connectivity()
        print("Sleeping for 60 seconds...")
        time.sleep(60)

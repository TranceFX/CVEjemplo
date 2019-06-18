# CVEJEMPLO

An application that downloads an 
example of curriculum vitae from the internet. 

The application shows a `UITableView` with the dynamic content, 
user data as well as the different jobs

## SUMMARY

the application uses the `MVP` architecture, 
to separate the logic from the view.

Includes a networking layer 
to make calls to web services 
through an `API` which receives a 
decodable object to handle the 
responses of the service

### EXAMPLE OF API USE


> Generic function for URLSession
    Get the data from a remote JSON
    - Parameters:
     - urlString: The url to the api endpoint
     - completion:
        - Parameters:
            - sucess: returns generic decodable data
            - failure: returns a string error
           
   
 ```swift
 
 ServiceManager.sharedInstance.getDataFromURL(urlString: `URL`, completion: {[weak self] (response: `DECODABLE OBJECT`?, error: String?) in
                
                guard let response = response, error == nil else {
                    return
                }
                
                //TRUE RESPONSE
                print(response)
                
            })
 
 ```

 ### EXAMPLE OF TEST CASES

 > TestConnection()
    
     TEST SUCCESS CONNECTION
     Test model in diferent situations
     - Parameters:
     - urlString: The url to the correct api endpoint
     - completion:
        - Parameters:
        - response: change the model to check
 > TestConnectionBad()
 > 
     TEST SUCCESS CONNECTION
     Test model in diferent situations
     - Parameters:
     - urlString: The url to the bad api endpoint
     - completion:
     - Parameters:
     - response: change the model to check
     
 > TestModelSections()
 > 
     TEST MODEL CASES
     Test model in diferent situations
     - Parameters:
     - from: The url to the api endpoint
     - JSONTEST:
     - Parameters:
     - SUCESS: returns a correct json and sections
     - FAILURE: return a valid json empty sections
     - ERROR: returns a invalid JSON string

 ### EXAMPLE OF UITEST


 > testIntroCells()
 > 
     TEST INTRO CELLS
     Test if tableview "Intro" contains cells
     Check if the cell exists
 > testJobsCells()
 > 
     TEST JOB CELLS
     Test if tableview "MyCareer" contains cells
     Check if the cell exists
 > testNavigation()
 > 
     TEST MODEL CASES
     Test the navigation across the screens
     and check if the elements exists
     INTRO:
     
     - Check if tableview exists
     
     USERVIEW:
     
     - Check if scrollView exists
     
     MYCAREER:
     
     - Check if tableview exists
     
     Fintally check if you're in home again

 ## CVEXAMPLE SCREENSHOTS


 > ### CVEXAMPLE
 > 
 > <b>HOME SECTION 
        ![img](https://i.imgur.com/X6Bx0Az.png)
 > MY INFORMATION
        ![img](https://i.imgur.com/AKFiTUv.png)
 > MY CAREER</b>
        ![img](https://i.imgur.com/KNBug18.png)
 
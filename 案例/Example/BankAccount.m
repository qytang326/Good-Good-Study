classdef BankAccount<handle
    properties (Hidden)
       AccountStatus='open';
    end
    properties (SetAccess = private)
        AccountNumber
        AccountBalance=0;
    end
    
    events
        InsufficientFunds
    end
    
    methods
        function BA=BankAccount(AccountNumber,InitialBalance)
            BA.AccountNumber=AccountNumber;
            BA.AccountBalance=InitialBalance;
            %AccountManager.addAccount(BA);
        end
        function deposite(BA,amt)
            BA.AccountBalance=BA.AccountBalance+amt;
            if BA.AccountBalance>0
                BA.AccountStatus='open';
            end
        end
        
        function withdraw(BA,amt)
            if(strcmp(BA.AccountStatus,'closed')&&BA.AccountBalance<0)
                disp(['Account',num2str(BA.AccountNumber),'has been closed'])
                return
            end
            newbal=BA.AccountBalance-amt;
            BA.AccountBalance=newbal;
            if newbal<0
                notify(BA,'InsufficientFunds')
            end
        end
    end
end
            
        

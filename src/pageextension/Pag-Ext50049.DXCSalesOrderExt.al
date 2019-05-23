pageextension 50049 "DXCSalesOrderExt" extends "Sales Order" 
{
    layout
    {
       addafter(Status)
        {
            field("Commission Rate";"Commission Rate")
            {
                
            }
        }
    }

    actions
    {
        addafter("Take over Measurements")
        {
            action("Set Commission Rates")
            {
                Image = UpdateDescription;
                trigger OnAction();
                begin
                    DXCUpdateCommisionRates;
                end;
            }

        }
    }
}


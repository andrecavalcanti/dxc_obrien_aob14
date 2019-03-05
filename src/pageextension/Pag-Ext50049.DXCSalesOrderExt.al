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
}


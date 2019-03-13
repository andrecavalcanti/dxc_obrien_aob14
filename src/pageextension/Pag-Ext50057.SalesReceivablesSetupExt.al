pageextension 50057 "SalesReceivablesSetupExt" extends "Sales & Receivables Setup" 
{
    //AOB-14

    layout
    {
        
        addafter("Ignore Updated Addresses")
        {
            field("Def. Sales Line Comm. to Fixed";"Def. Sales Line Comm. to Fixed")
            {
            }
        }
    }
    

}


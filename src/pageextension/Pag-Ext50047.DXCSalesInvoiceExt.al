pageextension 50047 "DXCSalesInvoiceExt" extends "Sales Invoice" 
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


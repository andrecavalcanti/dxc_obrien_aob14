pageextension 50048 "DXCSalesOrderSubformExt" extends "Sales Order Subform" 
{   

    layout
    {
        addafter("Unit Price")
        {
            field("Commission Rate";"Commission Rate")
            {
               Visible = false;
            }
        }
    }


}


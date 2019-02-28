pageextension 50047 "DXCSalesInvoiceExt" extends "Sales Invoice" 
{
    layout
    {
       addafter(Status)
        {
            field("Commission Rate";"Commission Rate")
            {
                Editable = ESACC_F50040_Editable;
                HideValue = ESACC_F50040_HideValue;
                Visible = ESACC_F50040_Visible;
            }
        }
    }
}


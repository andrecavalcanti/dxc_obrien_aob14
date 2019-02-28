pageextension 50046 "DXCSalesInvoiceSubformExt" extends "Sales Invoice Subform" 
{    
    layout
    {
      addafter("Unit Price")
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


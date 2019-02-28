tableextension 50025 "DXCSalesHeaderExt" extends "Sales Header" 
{    

    fields
    {
       field(50007;"Commission Rate";Decimal)
        {           

            trigger OnValidate();
            begin
                //SPR02
                UpdateCommisionRates;
            end;
        }
    }
      
}


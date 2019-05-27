tableextension 50025 "DXCSalesHeaderExt" extends "Sales Header" 
{    

    fields
    {
       field(50007;"Commission Rate";Decimal)
        {           

            trigger OnValidate();
            begin
                //SPR02
                // M DXCUpdateCommisionRates;
            end;
        }
    }      

    
    procedure DXCUpdateCommisionRates();  
        var
            SalesLine : Record "Sales Line";   
            SalesLineCommissionRate : Record "Sales Line Commission Rate";            
    begin
        SalesLineCommissionRate.RESET;
        SalesLineCommissionRate.SETRANGE("Source Type",Database::"Sales Line");
        SalesLineCommissionRate.SETRANGE("Source Subtype",SalesLineCommissionRate."Source Subtype"::"1");
        SalesLineCommissionRate.SETRANGE("Source ID",Rec."No.");        
        if SalesLineCommissionRate.FINDSET then
        repeat
            SalesLineCommissionRate.VALIDATE(Commission,Rec."Commission Rate");
            SalesLineCommissionRate.MODIFY;
        until SalesLineCommissionRate.NEXT = 0;
    end;


}


tableextension 50025 "DXCSalesHeaderExt" extends "Sales Header" 
{    

    fields
    {
       field(50007;"Commission Rate";Decimal)
        {           

            trigger OnValidate();
            begin
                //SPR02
                DXCUpdateCommisionRates;
            end;
        }
    }      

    
    procedure DXCUpdateCommisionRates();  
        var
            SalesLine : Record "Sales Line";               
    begin
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type","Document Type");
        SalesLine.SETRANGE("Document No.","No.");
        SalesLine.SETFILTER(Type,'%1|%2',SalesLine.Type::Item,SalesLine.Type::Resource);
        if SalesLine.FINDSET then
        repeat
            SalesLine.VALIDATE("Commission Rate","Commission Rate");
            SalesLine.MODIFY;

        until SalesLine.NEXT = 0;
    end;


}


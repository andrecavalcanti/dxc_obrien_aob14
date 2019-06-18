codeunit 50002 "DXCCommissionEventHandling"
{   

    [EventSubscriber(ObjectType::Page, 42, 'OnBeforeActionEvent', 'DXC Set Commission Rates', false, false)]
    local procedure HandleAfterActionOnDXCSetCommRatesOnSalesOrder(var Rec : Record "Sales Header")
        var            
        begin            
            //CommMgt.CreateAllSalesLineCommissionRates(Rec);
            CreateAllSalesLineCommissionRates(Rec);         
        end; 

    procedure CreateAllSalesLineCommissionRates(var SalesHeader : Record "Sales Header");
    var
        SalesLine : Record "Sales Line";
        CommMgt : Codeunit "Commission Mgt.";
    begin        
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        SalesLine.SETFILTER(Type, '%1|%2', SalesLine.Type::Item, SalesLine.Type::Resource);
        SalesLine.SETFILTER("No.", '>%1', '');
        if SalesLine.FINDFIRST then
          repeat
            CommMgt.CreateSalesLineCommissionRates(SalesLine);
          until SalesLine.NEXT = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, 5172102, 'OnAfterCreateSalesLineCommissionRates', '', false, false)]
    local procedure HandleAfterCreateSalesLineCommissionRatesOnCommissionMgt(var SalesLineCommissionRate : Record "Sales Line Commission Rate");
    var
        SalesHeader : Record "Sales Header";
        CommissionRecipient : Record "Commission Recipient";
        SalesRecSetup : Record "Sales & Receivables Setup";
    begin
        if SalesHeader.GET(SalesLineCommissionRate."Source Subtype",SalesLineCommissionRate."Source ID") then begin
        
            SalesRecSetup.GET;

            CommissionRecipient.GET(SalesLineCommissionRate."Commission Recipient No.");        
            
            if SalesRecSetup."Def. Sales Line Comm. to Fixed" then
                SalesLineCommissionRate."Fixed Commission Rate" := true;

            SalesLineCommissionRate."Commission Group Code" := CommissionRecipient."Commission Group Code"; 
            
            SalesLineCommissionRate.Commission := SalesHeader."Commission Rate";

        end;
    end;

    
}
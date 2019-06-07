codeunit 50002 "DXCCommissionEventHandling"
{
    [EventSubscriber(ObjectType::Table, 5172120, 'OnBeforeInsertEvent', '', false, false)]

    local procedure HandleBeforInsertOnReLine(var Rec : Record "Sales Line Commission Rate"; RunTrigger : Boolean);

    var       
        CommissionRecipient : Record "Commission Recipient";
        SalesRecSetup : Record "Sales & Receivables Setup";
    begin

        CommissionRecipient.GET(Rec."Commission Recipient No.");

        Rec."Commission Group Code" := CommissionRecipient."Commission Group Code"; 

        //<< AOB-14 
        SalesRecSetup.GET;
        if SalesRecSetup."Def. Sales Line Comm. to Fixed" then
            Rec."Fixed Commission Rate" := true;
        //<< AOB-14       

    end;     

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

    
}
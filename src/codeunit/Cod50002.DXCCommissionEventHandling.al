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
}
tableextension 50035 "DXCSalesReceivablesSetupExt" extends "Sales & Receivables Setup" 
{
    // AOB-14

    fields
    {
        field(50000;"Def. Sales Line Comm. to Fixed";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'AOB-14';
        }

    }


}


tableextension 50022 "DXCSalesLineCommissionRatesExt" extends "Sales Line Commission Rate" //MyTargetTableId
{
    fields
    {
        field(50000;"Commission Group Code";Code[20])
        {
            Editable = false;
            FieldClass = Normal;
        }
    }
    
}
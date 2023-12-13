using ProcessorService as service from '../../srv/processor-service';
using from '../../db/schema';

annotate service.Incidents with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.name,
            Label : '{i18n>Name1}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Statuscode}',
            Value : status_code,
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Urgencycode}',
            Value : urgency_code,
        },
    ]
);
annotate service.Incidents with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};
annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Urgencycode1}',
                Value : urgency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Statuscode1}',
                Value : status_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Conversations}',
            ID : 'i18nConversations',
            Target : 'conversations/@UI.LineItem#i18nConversations',
        },
    ]
);
annotate service.Incidents with @(
    UI.SelectionFields : [
        status_code,
        urgency_code,
    ]
);
annotate service.Incidents with {
    status @Common.Label : '{i18n>Statuscode}'
};
annotate service.Incidents with {
    urgency @Common.Label : '{i18n>Urgencycode}'
};
annotate service.Incidents with {
    urgency @Common.ValueListWithFixedValues : true
};
annotate service.Urgency with {
    code @Common.Text : descr
};
annotate service.Incidents with {
    status @Common.ValueListWithFixedValues : true
};
annotate service.Status with {
    code @Common.Text : descr
};
annotate service.Incidents with {
    status @Common.Text : status.descr
};

annotate service.Incidents with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        TypeImageUrl : 'sap-icon//alert',
    }
);
annotate service.Incidents with {
    urgency @Common.Text : urgency.descr
};
annotate service.Conversations with @(
    UI.LineItem #i18nConversations : [
        {
            $Type : 'UI.DataField',
            Value : author,
            Label : 'author',
        },{
            $Type : 'UI.DataField',
            Value : message,
            Label : 'message',
        },{
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : 'timestamp',
        },]
);

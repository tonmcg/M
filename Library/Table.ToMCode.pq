let func =   
 (Table as table) =>
let
Source = Table,
ListOfColumns = Table.ToColumns(Source),
ConvertToTable = Table.FromList(ListOfColumns, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
CoreString = Table.AddColumn(ConvertToTable, "Custom", each Text.Combine(List.Transform([Column1], each Text.From(_)),""" ,""")),
FullString = "= Table.FromColumns({ {"""& Text.Combine(CoreString[Custom], """}, {""")&"""} }, {""" & Text.Combine(Table.ColumnNames(Table), """, """) & """} )"
in
    FullString ,
documentation = [
Documentation.Name =  " Table.ToMCode ",
Documentation.Description = " Transforms a  <code>Table</code>  to a string of M code that will create that table in the query editor. ",
Documentation.LongDescription = " Transforms a  <code>Table</code>  to a string of M code that will create that table in the query editor. ",
Documentation.Category = " Table ",
Documentation.Source = "  ",
Documentation.Version = " 1.0 ",
Documentation.Author = " Imke Feldmann: www.TheBIccountant.com . ",
Documentation.Examples = {[Description =  "  ",
Code = "  ",
Result = "  "]}]
  
 in  
  Value.ReplaceType(func, Value.ReplaceMetadata(Value.Type(func), documentation))  


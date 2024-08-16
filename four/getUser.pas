procedure TWebModule1.GetUsers(Request: TWebRequest; Response: TWebResponse);
var
  Users: TStringList;
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := ADOConnection1;
    Query.SQL.Text := 'SELECT username, email FROM Users';
    Query.Open;

    Users := TStringList.Create;
    try
      while not Query.Eof do
      begin
        Users.Add(Format('User: %s, Email: %s', [Query.FieldByName('username').AsString, Query.FieldByName('email').AsString]));
        Query.Next;
      end;
      Response.Content := Users.Text;
    finally
      Users.Free;
    end;
  finally
    Query.Free;
  end;
end;

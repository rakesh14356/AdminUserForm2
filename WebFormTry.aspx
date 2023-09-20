<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormTry.aspx.cs" Inherits="AdminUserForm2.WebFormTry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form id="form1" runat="server">

                    <div class="form-group row row-label">
                        <label class="col-md-2 control-label">Name:</label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" placeholder="Enter name" CssClass="form-control" ID="nmTbx"></asp:TextBox>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="nmTbx" ValidationExpression="^[a-zA-Z]*$" ErrorMessage="Only contains characters" ForeColor="Red" ID="nameVal"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Name is Required" ControlToValidate="nmTbx" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

            <div class="form-group row row-button">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Register" CssClass="btn btn-primary" OnClick="RegClick" ID="Rgbtn" />
                            <asp:Button runat="server" Text="SignUp" CssClass="btn btn-primary" OnClick="SignClick" CausesValidation="false" />
                            <asp:Label runat="server" ID="lblReg" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>

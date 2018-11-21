<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="DataList.aspx.cs" Inherits="UI_DataList" %>  
  
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">  
     
</asp:Content>  
  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <div>  
        <fieldset style="width: 269px" ><legend><b>DataList Example</b></legend>  
            <div style="width: 250px; background-color: #99FF66;">  
        <asp:Table runat="server">  
            <asp:TableRow>  
                <asp:TableCell>Name</asp:TableCell><asp:TableCell><asp:TextBox ID="txtName" runat="server"></asp:TextBox ></asp:TableCell>  
            </asp:TableRow>  
  
            <asp:TableRow>  
                <asp:TableCell>Price</asp:TableCell><asp:TableCell><asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></asp:TableCell>  
            </asp:TableRow>  
  
            <asp:TableRow>  
                <asp:TableCell></asp:TableCell><asp:TableCell><asp:Button ID="btnSave" Text="Add Record" runat="server" OnClick="btnSave_Click" /></asp:TableCell>  
            </asp:TableRow>  
        </asp:Table>  
        </div>  
        </fieldset>  
        <br />  
    <fieldset style="width: 535px"><legend><b>Pest Database</b></legend>  
    <div style="background-color: #66FF66">  
    <asp:DataList ID="DataListEmp" runat="server"   
             DataKeyField="pestID"   
             OnDeleteCommand="DataListEmp_DeleteCommand"   
             OnEditCommand="DataListEmp_EditCommand"  
             OnUpdateCommand="DataListEmp_UpdateCommand"   
             OnCancelCommand="DataListEmp_CancelCommand" Width="527px" >  
            <HeaderTemplate>  
            <table><tr style="background-color: #800000; color: #FFFFFF">  
            <th>Name</th><th>Contact</th><th>Email ID</th><th>Action</th></tr>  
            </HeaderTemplate>  
            <ItemTemplate>  
            <tr >  
            <td><%# DataBinder.Eval(Container.DataItem, "name")%></td>  
            <td><%# DataBinder.Eval(Container.DataItem,"price")%></td>  
            <td><asp:Button ID="imgbtnedit" runat="server" Text="Edit"  ToolTip="Edit" CommandName="Edit"/></td>  
            <td><asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Delete" ToolTip="Delete"/></td>  
            </tr>            
            </ItemTemplate>  
            <EditItemTemplate>             
            <tr>  
             <td><asp:TextBox BackColor="Yellow" Font-Bold="true"  ID="txtName" runat="server" Text='<%# Eval("name") %>'></asp:TextBox></td>  
             <td><asp:TextBox BackColor="Yellow" Font-Bold="true" ID="txtContact" runat="server" Text='<%# Eval("price") %>'></asp:TextBox></td>    
             <td><asp:Button ID="btnupdate" runat="server"  ToolTip="Update" Text="Update" CommandName="Update" /></td>  
             <td><asp:Button ID="btncancel" runat="server"  ToolTip="Cancel" Text="Cancel" CommandName="Cancel" /></td>  
            </tr>  
            </EditItemTemplate>  
        </asp:DataList>  
        </div>  
        </fieldset>  
        </div>  
</asp:Content>  
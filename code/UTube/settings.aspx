<%@ Page Title="" Language="C#" MasterPageFile="~/profile.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="UTube.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    General Account Settings
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="settings-table">
        <span class="toggle-cl">Name Change</span>
        <p>
            Change Your User Name :
            <asp:TextBox ID="tbName" runat="server" CssClass="settings-tb"></asp:TextBox>
        </p>
        <hr />
        <span class="toggle-cl">Password</span>
        <p>
            Change Your User Password :<asp:TextBox ID="tbPassword" runat="server" CssClass="settings-tb" TextMode="Password"></asp:TextBox><br />
            Confirm Your User Password :<asp:TextBox ID="tbConfirm" runat="server" CssClass="settings-tb" TextMode="Password"></asp:TextBox>
        </p>
        <hr />
        <span class="toggle-cl">Email</span>
        <p>
            <i class="n2r-lock"></i> &nbsp;&nbsp;<asp:Label ID="lblEmail" runat="server" ToolTip="Email cannot be changed"></asp:Label>
        </p>
        <hr />
        <span class="toggle-cl">Change Date of Birth</span>
        <p>
            <asp:Label ID="lblDOB" runat="server"></asp:Label><br />
            <asp:DropDownList ID="ddlDay" runat="server">
                <asp:ListItem Value="00" Selected="True">Day</asp:ListItem>
                <asp:ListItem Value="01">1</asp:ListItem>
                <asp:ListItem Value="02">2</asp:ListItem>
                <asp:ListItem Value="03">1</asp:ListItem>
                <asp:ListItem Value="04">1</asp:ListItem>
                <asp:ListItem Value="05">2</asp:ListItem>
                <asp:ListItem Value="06">2</asp:ListItem>
                <asp:ListItem Value="07">7</asp:ListItem>
                <asp:ListItem Value="08">8</asp:ListItem>
                <asp:ListItem Value="09">9</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
                <asp:ListItem Value="13">13</asp:ListItem>
                <asp:ListItem Value="14">14</asp:ListItem>
                <asp:ListItem Value="15">15</asp:ListItem>
                <asp:ListItem Value="16">16</asp:ListItem>
                <asp:ListItem Value="17">17</asp:ListItem>
                <asp:ListItem Value="18">18</asp:ListItem>
                <asp:ListItem Value="19">19</asp:ListItem>
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="21">21</asp:ListItem>
                <asp:ListItem Value="22">22</asp:ListItem>
                <asp:ListItem Value="23">23</asp:ListItem>
                <asp:ListItem Value="24">24</asp:ListItem>
                <asp:ListItem Value="25">25</asp:ListItem>
                <asp:ListItem Value="26">26</asp:ListItem>
                <asp:ListItem Value="27">27</asp:ListItem>
                <asp:ListItem Value="28">28</asp:ListItem>
                <asp:ListItem Value="29">29</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="31">31</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID ="ddlMonth" runat="server">
                <asp:ListItem Value="00" Selected="True">Month</asp:ListItem>
                <asp:ListItem Value="01">January</asp:ListItem>
                <asp:ListItem Value="02">Feburary</asp:ListItem>
                <asp:ListItem Value="03">March</asp:ListItem>
                <asp:ListItem Value="04">April</asp:ListItem>
                <asp:ListItem Value="05">May</asp:ListItem>
                <asp:ListItem Value="06">June</asp:ListItem>
                <asp:ListItem Value="07">July</asp:ListItem>
                <asp:ListItem Value="08">August</asp:ListItem>
                <asp:ListItem Value="08">September</asp:ListItem>
                <asp:ListItem Value="09">October</asp:ListItem>
                <asp:ListItem Value="10">November</asp:ListItem>
                <asp:ListItem Value="12">December</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlYear" runat="server">
                <asp:ListItem Value="00" Selected="True">Year</asp:ListItem>
                <asp:ListItem Value="2016">2016</asp:ListItem>
                <asp:ListItem Value="2015">2015</asp:ListItem>
                <asp:ListItem Value="2014">2014</asp:ListItem>
                <asp:ListItem Value="2013">2013</asp:ListItem>
                <asp:ListItem Value="2012">2012</asp:ListItem>
                <asp:ListItem Value="2011">2011</asp:ListItem>
                <asp:ListItem Value="2010">2010</asp:ListItem>
                <asp:ListItem Value="2009">2009</asp:ListItem>
                <asp:ListItem Value="2008">2008</asp:ListItem>
                <asp:ListItem Value="2007">2007</asp:ListItem>
                <asp:ListItem Value="2006">2006</asp:ListItem>
                <asp:ListItem Value="2005">2005</asp:ListItem>
                <asp:ListItem Value="2004">2004</asp:ListItem>
                <asp:ListItem Value="2003">2003</asp:ListItem>
                <asp:ListItem Value="2002">2002</asp:ListItem>
                <asp:ListItem Value="2001">2001</asp:ListItem>
                <asp:ListItem Value="2000">2000</asp:ListItem>
                <asp:ListItem Value="1999">1999</asp:ListItem>
                <asp:ListItem Value="1998">1998</asp:ListItem>
                <asp:ListItem Value="1997">1997</asp:ListItem>
                <asp:ListItem Value="1996">1996</asp:ListItem>
                <asp:ListItem Value="1995">1995</asp:ListItem>
                <asp:ListItem Value="1994">1994</asp:ListItem>
                <asp:ListItem Value="1993">1993</asp:ListItem>
                <asp:ListItem Value="1992">1992</asp:ListItem>
                <asp:ListItem Value="1991">1991</asp:ListItem>
                <asp:ListItem Value="1990">1990</asp:ListItem>
                <asp:ListItem Value="1989">1989</asp:ListItem>
                <asp:ListItem Value="1988">1988</asp:ListItem>
                <asp:ListItem Value="1987">1987</asp:ListItem>
                <asp:ListItem Value="1986">1986</asp:ListItem>
                <asp:ListItem Value="1985">1985</asp:ListItem>
                <asp:ListItem Value="1984">1984</asp:ListItem>
                <asp:ListItem Value="1983">1983</asp:ListItem>
                <asp:ListItem Value="1982">1982</asp:ListItem>
                <asp:ListItem Value="1981">1981</asp:ListItem>
                <asp:ListItem Value="1980">1980</asp:ListItem>
                <asp:ListItem Value="1979">1979</asp:ListItem>
                <asp:ListItem Value="1978">1978</asp:ListItem>
                <asp:ListItem Value="1977">1977</asp:ListItem>
                <asp:ListItem Value="1976">1976</asp:ListItem>
                <asp:ListItem Value="1975">1975</asp:ListItem>
                <asp:ListItem Value="1974">1974</asp:ListItem>
                <asp:ListItem Value="1973">1973</asp:ListItem>
                <asp:ListItem Value="1972">1972</asp:ListItem>
                <asp:ListItem Value="1971">1971</asp:ListItem>
                <asp:ListItem Value="1970">1970</asp:ListItem>
                <asp:ListItem Value="1969">1969</asp:ListItem>
                <asp:ListItem Value="1968">1968</asp:ListItem>
                <asp:ListItem Value="1967">1967</asp:ListItem>
                <asp:ListItem Value="1966">1966</asp:ListItem>
                <asp:ListItem Value="1965">1965</asp:ListItem>
                <asp:ListItem Value="1964">1964</asp:ListItem>
                <asp:ListItem Value="1963">1963</asp:ListItem>
                <asp:ListItem Value="1962">1962</asp:ListItem>
                <asp:ListItem Value="1961">1961</asp:ListItem>
                <asp:ListItem Value="1960">1960</asp:ListItem>
                <asp:ListItem Value="1959">1959</asp:ListItem>
                <asp:ListItem Value="1958">1958</asp:ListItem>
                <asp:ListItem Value="1957">1957</asp:ListItem>
                <asp:ListItem Value="1956">1956</asp:ListItem>
                <asp:ListItem Value="1955">1955</asp:ListItem>
                <asp:ListItem Value="1954">1954</asp:ListItem>
                <asp:ListItem Value="1953">1953</asp:ListItem>
                <asp:ListItem Value="1952">1952</asp:ListItem>
                <asp:ListItem Value="1951">1951</asp:ListItem>
                <asp:ListItem Value="1950">1950</asp:ListItem>
                <asp:ListItem Value="1949">1949</asp:ListItem>
                <asp:ListItem Value="1948">1948</asp:ListItem>
                <asp:ListItem Value="1947">1947</asp:ListItem>
                <asp:ListItem Value="1946">1946</asp:ListItem>
                <asp:ListItem Value="1945">1945</asp:ListItem>
                <asp:ListItem Value="1944">1944</asp:ListItem>
                <asp:ListItem Value="1943">1943</asp:ListItem>
                <asp:ListItem Value="1942">1942</asp:ListItem>
                <asp:ListItem Value="1941">1941</asp:ListItem>
                <asp:ListItem Value="1940">1940</asp:ListItem>
                <asp:ListItem Value="1939">1939</asp:ListItem>
                <asp:ListItem Value="1938">1938</asp:ListItem>
                <asp:ListItem Value="1937">1937</asp:ListItem>
                <asp:ListItem Value="1936">1936</asp:ListItem>
                <asp:ListItem Value="1935">1935</asp:ListItem>
                <asp:ListItem Value="1934">1934</asp:ListItem>
                <asp:ListItem Value="1933">1933</asp:ListItem>
                <asp:ListItem Value="1932">1932</asp:ListItem>
                <asp:ListItem Value="1931">1931</asp:ListItem>
                <asp:ListItem Value="1930">1930</asp:ListItem>
                <asp:ListItem Value="1929">1929</asp:ListItem>
                <asp:ListItem Value="1928">1928</asp:ListItem>
                <asp:ListItem Value="1927">1927</asp:ListItem>
                <asp:ListItem Value="1926">1926</asp:ListItem>
                <asp:ListItem Value="1925">1925</asp:ListItem>
                <asp:ListItem Value="1924">1924</asp:ListItem>
                <asp:ListItem Value="1923">1923</asp:ListItem>
                <asp:ListItem Value="1922">1922</asp:ListItem>
                <asp:ListItem Value="1921">1921</asp:ListItem>
                <asp:ListItem Value="1920">1920</asp:ListItem>
                <asp:ListItem Value="1919">1919</asp:ListItem>
                <asp:ListItem Value="1918">1918</asp:ListItem>
                <asp:ListItem Value="1917">1917</asp:ListItem>
                <asp:ListItem Value="1916">1916</asp:ListItem>
                <asp:ListItem Value="1915">1915</asp:ListItem>
                <asp:ListItem Value="1914">1914</asp:ListItem>
                <asp:ListItem Value="1913">1913</asp:ListItem>
                <asp:ListItem Value="1912">1912</asp:ListItem>
                <asp:ListItem Value="1911">1911</asp:ListItem>
                <asp:ListItem Value="1910">1910</asp:ListItem>
                <asp:ListItem Value="1909">1909</asp:ListItem>
                <asp:ListItem Value="1908">1908</asp:ListItem>
                <asp:ListItem Value="1907">1907</asp:ListItem>
                <asp:ListItem Value="1906">1906</asp:ListItem>
                <asp:ListItem Value="1905">1905</asp:ListItem>

            </asp:DropDownList>
        </p>
        <hr />
        <span class="toggle-cl">Profile Image </span>
        <p>
            Choose profile image :
                <asp:FileUpload ID="fuDP" runat="server" CssClass="settings-tb" /><br />
            <asp:Image ID="imgDP" runat="server" ImageUrl="~/img/salityx.png" CssClass="settings-img" />

        </p>
        <hr />
        <asp:Button ID="btnSave" runat="server" Text="Save" Style="float: right;" CssClass="theme-btn-1" OnClick="btnSave_Click" />
    </div>
    <div class="clear-it"></div><br />
    <div id="inform">
        Did you find what you needed? | Please don't share ur password
    </div>


    <div id="valid-area">
        <div id="pass-strength" class="validation-div">
            <div class="top-triangle"></div>
            <div class="background">
            <span class="heading">Need to Have</span><br />
            <img src="img/icons/tick_green.png" class="min-char-img" /><span class="min-char gray-font"> 12 Charecters Minimum</span><br />
            <img src="img/icons/tick_green.png" class="upper-lower-img" /><span class="upper-lower gray-font"> Lowercase and Uppercase</span><br />
            <img src="img/icons/tick_green.png" class="number-img" /><span class="number gray-font"> Atleast One Number</span><br />
            <img src="img/icons/tick_green.png" class="special-char-img" /><span class="special-char gray-font"> Special Charrecters</span><br />
            <span class="heading">Strength</span><br />
            <div id="strenght-detect">
                <div class="st1" style="width:33%;"></div><div class="st2" style="width:33%;"></div><div class="st3" style="width:34%;"></div>
            </div>
            <span class="gray-font">Please don't use same password like others sites. use an Unique password</span>
                </div>
        </div>

                

            <div id="Password-confirm" class="validation-div">
            <div class="top-triangle"></div>
            <div class="background">
            <img src="img/icons/tick_green.png" class="Password-confirm-img" /><span class="Password-confirm gray-font"> Same Password as top</span><br />
                </div>
        </div>
                        
            </div>
    <script>
        $(document).ready(function () {
            $('.toggle-cl').click(function () {
                $('+p', $(this)).toggle();
            });

        });

    </script><script src="js/validation.js"></script>
</asp:Content>
<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DashBorad.aspx.vb" Inherits="DashBorad" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);

        /* Bootstrap Icons */
        @import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");
    </style>

    <div class="container-fluid mt-2">
        <!-- Card stats -->
        <div class="row g-6 mb-6">
            <div class="col-xl-3 col-sm-6 col-12 ">
                <div class="card shadow border-0 " style="background-color: #01001f;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <span class="h6 font-semibold text-muted text-md d-block mb-2">Apply Leaves</span>
                                <span class="h3 font-bold mb-0">
                                    <h3>
                                        <asp:Label runat="server" ForeColor="Gray" ID="Leave_label" Text="label"></asp:Label></h3>
                                </span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                    <%--  <i class="bi bi-people""></i>--%>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 mb-0 text-sm">
                            <span class="badge badge-pill bg-soft-success text-success me-2">
                                <i class="bi bi-arrow-up me-1"></i>
                            </span>
                            <span class="text-nowrap text-md text-muted">Total Leave Available</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12">
                <a href="DailyWork.aspx">
                    <div class="card shadow border-0" style="background-color: #01001f;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <span class="h6 font-semibold text-muted text-md d-block mb-2">Enter Dailywork</span>
                                    <span class="h3 font-bold mb-0"><%=workcount%></span>
                                </div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-primary text-white text-lg rounded-circle">
                                        <i class="bi bi-people"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm">
                                <span class="badge badge-pill bg-soft-success text-success me-2">
                                    <i class="bi bi-arrow-up me-1"></i>
                                </span>
                                <span class="text-nowrap text-md text-muted">Click Here</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-sm-6 col-12">
                <div class="card shadow border-0" style="background-color: #01001f;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <span class="h6 font-semibold text-muted text-md d-block mb-2" style="color: white; font-weight: bold;">Total Earning</span>
                                <span class="h3 font-bold mb-0">
                                    <asp:Label runat="server" ForeColor="gray" ID="updateaddress_name"></asp:Label></span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape bg-info text-white text-lg rounded-circle">
                                    <i class="bi bi-clock-history"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 mb-0 text-sm">
                            <span class="badge badge-pill bg-soft-success text-danger me-2">
                                <i class="bi bi-arrow-up me-1"></i>
                            </span>
                            <span class="text-nowrap text-md text-muted">Since Joined</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12">
                <div class="card shadow border-0" style="background-color: #01001f;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <span class="h6 font-semibold text-muted text-sm d-block mb-2">Holdiday List</span>
                                <span class="h3 font-bold mb-0">100%</span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape bg-warning text-white text-lg rounded-circle">
                                    <i class="bi bi-minecart-loaded"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 mb-0 text-sm">
                            <span class="badge badge-pill bg-soft-success text-success me-2">
                                <i class="bi bi-arrow-up me-1"></i>
                            </span>
                            <span class="text-nowrap text-md text-muted">
                                <asp:Label runat="server" ID="holiday_year"></asp:Label></span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="display: grid; grid-template-columns: 5fr 7fr;">
                    <div style="background-color: #01001f; padding: 10px; border-radius: 15px; height: 69vh;">
                        <div class="phead" style="color: white; text-align: center; background-color: #278f8b; padding: 5px; border-radius: 5px; font-family: Georgia; font-weight: bold; font-size: 22px;">Employee Profile</div>
                        <div class="pimg mt-2" style="text-align: center; border-radius: 50%;">
                            <img src="https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_1280.png" width="150px" height="150px" />
                        </div>
                        <div class="pbody mt-5 mb-5" style="height: 350px;">
                            <asp:Panel runat="server" ID="profilepanel">
                                <div style="background-color: #177565; color: white; padding: 20px; border-radius: 15px; font-family: 'Arial Rounded MT'">
                                    <table class="w-100">
                                        <tr>
                                            <td>EMPLOYEE ID</td>
                                            <td>
                                                <asp:Label ID="empid" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>NAME</td>
                                            <td>
                                                <asp:Label ID="namelabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>DEPARTMENT</td>
                                            <td>
                                                <asp:Label ID="dptlabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>DESIGNATION</td>
                                            <td>
                                                <asp:Label ID="dsglabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>DOB</td>
                                            <td>
                                                <asp:Label ID="doblabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>GENDER</td>
                                            <td>
                                                <asp:Label ID="genderlabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>ABOUT</td>
                                            <td>
                                                <asp:Label ID="aboutlabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="contactpanel" Visible="false">
                                <div style="background-color: #994302; color: white; padding: 20px; border-radius: 15px; font-family: 'Arial Rounded MT'">
                                    <table class="w-100">
                                        <tr>
                                            <td>EMPLOYEE ID</td>
                                            <td>
                                                <asp:Label ID="cempidlabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>NAME</td>
                                            <td>
                                                <asp:Label ID="cempnamelabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>EMAIL</td>
                                            <td>
                                                <asp:Label ID="emailLabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>PHONE</td>
                                            <td>
                                                <asp:Label ID="phoneNumberLabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td>
                                                <asp:Label ID="addresslabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>

                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="projectpanel" Visible="false">
                                <div style="background-color: #700a52; color: white; padding: 20px; border-radius: 15px; font-family: 'Arial Rounded MT'">
                                    <table class="w-100">
                                        <tr>
                                            <td>EMPLOYEE ID</td>
                                            <td>
                                                <asp:Label ID="pemplabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>NAME</td>
                                            <td>
                                                <asp:Label ID="pempnamelabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>

                                        <tr>
                                            <td>PROJECT</td>
                                            <td>
                                                <asp:Label ID="projectLabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>MANAGER</td>
                                            <td>
                                                <asp:Label ID="managerLabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>PROJECT FEE</td>
                                            <td>
                                                <asp:Label ID="salaryLabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>JOINING DATE</td>
                                            <td>
                                                <asp:Label ID="hireDateLabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>STATUS</td>
                                            <td>
                                                <asp:Label ID="statusLabel" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="pfooter d-flex w-100 justify-content-around mt-5">
                            <div>
                                <asp:Button runat="server" CssClass="btn btn-success" ID="profilebtn" Text="Profile" OnClick="profilebtn_Click" />
                            </div>
                            <div>
                                <asp:Button runat="server" CssClass="btn btn-warning" ID="contactbtn" Text="Contact" OnClick="contactbtn_Click" />
                            </div>
                            <div>
                                <asp:Button runat="server" CssClass="btn btn-danger" ID="projectbtn" Text="Project" OnClick="projectbtn_Click" />
                            </div>
                        </div>
                    </div>
                    <div class=" w-100">
                       
                        <asp:Panel runat="server" ID="graphpanel"  Visible="True">

                        <div style="background-color: white; height: 400px; border-radius: 15px; margin-left: 10px;">
                            <div style="border-color:#177565;">
                                <figure class="highcharts-figure">
                                    <div id="container"></div>

                                    <div id="sliders">
                                        <table style="display:none;">
                                            <tr>
                                                <td>
                                                    <label for="alpha">Alpha Angle</label></td>
                                                <td>
                                                    <input id="alpha" type="range" min="0" max="45" value="15" />
                                                    <span id="alpha-value" class="value"></span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="beta">Beta Angle</label></td>
                                                <td>
                                                    <input id="beta" type="range" min="-45" max="45" value="90" />
                                                    <span id="beta-value" class="value"></span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="depth">Depth</label></td>
                                                <td>
                                                    <input id="depth" type="range" min="20" max="100" value="50" />
                                                    <span id="depth-value" class="value"></span></td>
                                            </tr>
                                        </table>
                                    </div>
                                </figure>
                            </div>


                        </div>

                        <div class="d-flex justify-content-between align-items-center p-1 mt-5">

                            <div class="m-2" style="height:205px; width:100%;background-color: #01001f; border-radius:15px;">
                                <div class="text-center" style="font-weight:bold; color:red;">UPCOMING HOLIDAY</div>
                            </div>
                            <div class="m-2" style="height:205px;background-color: #01001f;width:100%;border-radius:15px;" >
                                <div class="text-center" style="font-weight:bold; color:red;">PAY ROLL</div>
                            </div>
                        </div>




</asp:Panel>


                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="profilebtn" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="contactbtn" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="projectbtn" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>



        <div style="display:none;"><asp:Table ID="graphtable" runat="server"></asp:Table></div>
        

    </div>


    <%-- </div>--%>

    <style>
        #container {
            height: 390px;
            width: 800px;
            margin-top: 10px;
        }

        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 400px;
            max-width: 800px;
            margin: 1em auto;
        }

        #sliders td input[type="range"] {
            display: inline;
        }

        #sliders td {
            padding-right: 1em;
            white-space: nowrap;
        }
    </style>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>


   <%-- <script>
        const chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 0,
                    beta: 0,
                    depth: 50,
                    viewDistance: 25
                }
            },
            xAxis: {
                categories: [
'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October'
                ]
            },
            yAxis: {
                title: {
                    enabled: false
                }
            },
            tooltip: {
                headerFormat: '<b>{point.key}</b><br>',
                pointFormat: 'Cars sold: {point.y}'
            },
            title: {
                text: 'Working Day Details',
                align: 'center'
            },
            subtitle: {
                text: '',
                align: 'left'
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                column: {
                    depth: 25
                }
            },
            series: [{
                data: [1318, 1073, 1060, 813, 775, 745, 537, 444, 416, 395],
                colorByPoint: true
            }]
        });

        function showValues() {
            document.getElementById(
                'alpha-value'
            ).innerHTML = chart.options.chart.options3d.alpha;
            document.getElementById(
                'beta-value'
            ).innerHTML = chart.options.chart.options3d.beta;
            document.getElementById(
                'depth-value'
            ).innerHTML = chart.options.chart.options3d.depth;
        }

        // Activate the sliders
        document.querySelectorAll(
            '#sliders input'
        ).forEach(input => input.addEventListener('input', e => {
            chart.options.chart.options3d[e.target.id] = parseFloat(e.target.value);
        showValues();
        chart.redraw(false);
        }));

        showValues();


    </script>--%>


<script>
    // Initialize chart variable
    let chart;

    var table = document.getElementById("<%= graphtable.ClientID %>");
    var monthArray = [];
    var dayArray = [];

    // Loop through each row of the table
    for (var i = 0; i < table.rows.length; i++) {
        var cells = table.rows[i].cells;
        var month = cells[0].innerText.trim();
        var day = parseInt(cells[1].innerText.trim()); // Convert day to integer
        // Push month and day data into respective arrays
        monthArray.push(month);
        dayArray.push(day);
    }

    // Output the arrays
    console.log("Months: ", monthArray);
    console.log("Days: ", dayArray);

    // Function to initialize Highcharts chart
    function initializeHighcharts() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 0,
                    beta: 0,
                    depth: 0,
                    viewDistance: 25
                }
            },
            xAxis: {
                categories: monthArray,
                gridLineWidth: 0, // Set gridLineWidth to 0 to hide the grid lines
                minorGridLineWidth: 0 // Set minorGridLineWidth to 0 to hide minor grid lines
            },
            yAxis: {
                title: {
                    enabled: false
                },
                gridLineWidth: 0, // Set gridLineWidth to 0 to hide the grid lines
                minorGridLineWidth: 0 // Set minorGridLineWidth to 0 to hide minor grid lines
            },
            tooltip: {
                headerFormat: '<b>{point.key}</b><br>',
                pointFormat: 'Worked: {point.y}'
            },
            title: {
                text: 'Working Day Details',
                align: 'center'
            },
            subtitle: {
                text: '',
                align: 'left'
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                column: {
                    depth: 25
                }
            },
            series: [{
                data: dayArray, // Replace static data with dayArray
                colorByPoint: true
            }]
        });

        // Show initial values
        showValues();
    }

    // Function to show values
    function showValues() {
        document.getElementById('alpha-value').innerHTML = chart.options.chart.options3d.alpha;
        document.getElementById('beta-value').innerHTML = chart.options.chart.options3d.beta;
        document.getElementById('depth-value').innerHTML = chart.options.chart.options3d.depth;
    }

    // Function to activate the sliders
    function activateSliders() {
        document.querySelectorAll('#sliders input').forEach(input => {
            input.addEventListener('input', e => {
                chart.options.chart.options3d[e.target.id] = parseFloat(e.target.value);
        showValues();
        chart.redraw(false);
    });
    });
    }

    // Call initialization function on document ready
    document.addEventListener('DOMContentLoaded', function() {
        initializeHighcharts();
        activateSliders();
    });

    // Reinitialize Highcharts after each partial postback
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function() {
        initializeHighcharts();
        activateSliders();
    });
</script>

</asp:Content>


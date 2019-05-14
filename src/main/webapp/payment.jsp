<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Point Of Sales | Dashboard</title>

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">


</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" >
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Payment
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Payment</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-4">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add Payment</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form">
                            <div class="box-body">

                                <div class="form-group">
                                    <label >Payment ID</label>
                                    <input type="text" class="form-control" id="textPaymentID" placeholder="Enter Payment ID">
                                </div>
                                <div class="form-group">
                                    <label >Description</label>
                                    <input type="text" class="form-control" id="textDescription" placeholder="Enter Description">
                                </div>
                                <div class="form-group">
                                    <label >Unit Price</label>
                                    <input type="text" class="form-control" id="textPrice" placeholder="Enter Unit Price">
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="text" class="form-control" id="textQty" placeholder="Enter Quantity">
                                </div>

                            </div>
                            <!-- /.box-body -->


                            <div class="box-footer" style="text-align: left">
                                <button type="button" class="btn btn-primary" id="btnSave" style="margin-left:100px">ADD</button>
                                <button type="reset" class="btn btn-primary" style="margin-left:30px">Clear</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Payment Information</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="tblItems" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Payment ID</th>
                                    <th>Description</th>
                                    <th>Unit Price</th>
                                    <th>Quantity</th>
                                    <th>Remove</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Payment ID</th>
                                    <th>Description</th>
                                    <th>Unit Price</th>
                                    <th>Quantity</th>
                                    <th>Remove</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <!-- Default to the left -->
        <p style="text-align: center"><strong>Copyright &copy; PAF </strong> | Group 406-G8</p>
    </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="js/jquery-3.4.1.min.js"></script>

<!-- Bootstrap 3.3.7 -->
<script src="js/bootstrap.min.js"></script>
<!-- Bootstrap bundle -->
<script src="js/bootstrap.bundle.js"></script>

<script src="js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="js/bootstrap.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>

<script>
    var SERVER_URL = "http://localhost:8080";

    $("#btnSave").click(function(){

        if ($("#textItemCord").attr("disabled")){

            var payment = {
                id: $("#textPaymentID").val(),
                description: $("#textDescription").val(),
                unitPrice: $("#textPrice").val(),
                qtyOnHand: $("#textQty").val()
            };

            var ajaxConfig = {
                method: "PUT",
                url: SERVER_URL + "/api/v1/items/" + $("#textPaymentID").val(),
                async: true,
                contentType: "application/json",
                data: JSON.stringify(payment)
            }

            $.ajax(ajaxConfig).done(function(response,statusText,jxhr){
                alert("Updated Successfully");
                loadAllCustomers();
                $('button[type="reset"]').trigger("click");
            }).fail(function(jxhr,statusText,error){
                alert("Unable to update the Item, try again");
                console.log(error);
            });

        }else{

            var item = {
                code: $("#textItemCord").val(),
                description: $("#textItemName").val(),
                unitPrice: $("#textItemPrice").val(),
                qtyOnHand: $("#textItemQty").val()
            };

            var ajaxConfig = {
                method: "POST",
                url: SERVER_URL + "/api/v1/items/",
                async: true,
                contentType: "application/json",
                data: JSON.stringify(item)
            }

            $.ajax(ajaxConfig).done(function(response,statusText,jxhr){
                alert("Added Successfully");
                loadAllCustomers();
                $('button[type="reset"]').trigger("click");
            }).fail(function(jxhr,statusText,error){
                alert("Unable to save the Item, try again");
                console.log(error);
            });


        }

    });

    $('button[type="reset"]').click(function(){
        $("#tblItems tbody tr").removeClass("selected-row");
        $("#textItemCord").attr("disabled",false);
    });

    $(document).ready(function(){

        loadAllCustomers();

    });

    function loadAllCustomers(){

        $("#tblItems").dataTable().fnDestroy();
        $("#tblItems tbody tr").remove();

        var ajaxConfig = {
            method: "GET",
            url:SERVER_URL + "/api/v1/items",
            async: true
        };

        $.ajax(ajaxConfig).done(function(items,statusText,jxhr){

            items.forEach(function(item){
//textItemQty textItemPrice textItemName textItemCord
                var html = `<tr>
                                <td>${item.code}</td>
                                <td>${item.description}</td>
                                <td>${item.unitPrice}</td>
                                <td>${item.qtyOnHand}</td>
                                <td><button type="button" class="btn btn-success delete">Delete</button></td>
                            </tr>`;

                $("#tblItems tbody").append(html);

                $("#tblItems tbody tr").off("click");
                $("#tblItems tbody tr").click(function(){
                    $("#tblItems tbody tr").removeClass("selected-row");
                    $(this).addClass("selected-row");

                    $("#textItemCord").val($(this).find("td:first-child").text());
                    $("#textItemCord").attr("disabled",true);
                    $("#textItemName").val($(this).find("td:nth-child(2)").text());
                    $("#textItemPrice").val($(this).find("td:nth-child(3)").text());
                    $("#textItemQty").val($(this).find("td:nth-child(4)").text());

                });

                $("button.delete").off("click");
                $("button.delete").click(function(eventData){

                    eventData.stopPropagation();

                    var row = $(this).parents("tr");
                    var customerId = (row.find("td:first-child").text());

                    if (confirm("Are you sure to delete this Item?")){

                        var ajaxConfig = {
                            method : "DELETE",
                            url: SERVER_URL + "/api/v1/items/" + customerId,
                            async: true
                        }

                        $.ajax(ajaxConfig).done(function(response,statusText,jxhr){

                            $(row).remove();

                        }).fail(function(jxhr,statusText,error){

                            console.log(jxhr.responseText);

                        });

                    }
                });

            });

            $('#tblItems').DataTable({
                'paging'      : true,
                'lengthChange': false,
                'searching'   : true,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : true,
                'pageLength'  : 5,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search Items..."
                }
            });

        }).fail(function(jxhr,statusText,error){
            console.log(error);
        });


    }
</script>
</body>
</html>
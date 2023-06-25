$(document).on("ajax:success", "form", function (event) {
    var data = event.detail[0];
    console.log(event);
    if (data.success) {
        $("#createNewStage").modal("hide");
    } else {
        alert("There was an error creating the record.");
    }
});

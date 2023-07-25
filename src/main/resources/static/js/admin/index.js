/**
 * 
 */
$(document).ready(function () {
    // Function to update the table rows based on selected filters
    function updateTableRows() {
      var approvedFilter = $(".filter-checkbox[data-filter='true']:checked").length > 0;
      var featuredFilter = $(".filter-checkbox[data-filter='false']:checked").length > 0;

      $("#businessTable tbody tr").each(function () {
        var isApproved = $(this).find("td:nth-child(5)").text().trim().toLowerCase() === "true";
        var isFeatured = $(this).find("td:nth-child(4)").text().trim().toLowerCase() === "true";

        if ((!approvedFilter || (approvedFilter && isApproved)) &&
            (!featuredFilter || (featuredFilter && isFeatured))) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    }

    // Add event listener to the checkboxes for filtering
    $(".filter-checkbox").on("change", function () {
      updateTableRows();
    });

    // Initial update of the table rows based on the default checkboxes
    updateTableRows();
  });
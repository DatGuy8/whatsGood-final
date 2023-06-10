/**
 * 
 */
 
 
$(document).ready(function() {
  $('.filter-btn').on('click', function() {
    var filterValue = $(this).data('filter');
    console.log(filterValue);
    if (filterValue === 'all') {
      $('#businessTable tbody tr').show();
    } else {
      $('#businessTable tbody tr').each(function() {
        var approvedValue = $(this).find('td:nth-child(5)').text().trim().toLowerCase();
        if ((filterValue === true && approvedValue === 'true') || (filterValue === false && approvedValue === 'false')) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    }
  });
});
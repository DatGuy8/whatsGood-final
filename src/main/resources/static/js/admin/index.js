$(document).ready(function() {
  $('.filter-btn').on('click', function() {
    let filterValue = $(this).data('filter');
    
    
    if (filterValue === 'all') {
      $('#businessTable tbody tr').show();
    } 
    
    else {
      $('#businessTable tbody tr').each(function() {
        let approvedValue = $(this).find('td:nth-child(5)').text().trim().toLowerCase();
        let featuredValue = $(this).find('td:nth-child(4)').text().trim().toLowerCase();
        if ((filterValue === true && approvedValue === 'true') || (filterValue === false && approvedValue === 'false') || (filterValue === "featured" && featuredValue === "true") || (filterValue === "notFeatured" && featuredValue === "false")) {
          $(this).show();
        } 
        else {
          $(this).hide();
        }
      });
    }
  });
});

$(document).ready(function() {
  $('.filter-btn-users').on('click', function() {
    let filterValue = $(this).data('filter');
 
    
    if (filterValue === 'all') {
      $('#businessTable tbody tr').show();
    } 
    
    else {
      $('#businessTable tbody tr').each(function() {
        let role = $(this).find('td:nth-child(4)').text();
        if ((filterValue === role)) {
          $(this).show();
        } 
        else {
          $(this).hide();
        }
      });
    }
  });
});
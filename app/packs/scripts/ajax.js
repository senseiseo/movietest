import $ from 'jquery'
// document.getElementById('.js_create_ratings')
// addEventListener('click', function(е) {
//     е.preventDefault()
//     console.log("hello")
//     Rails.ajax({
//         url: "/ratings_create",
//         type: "post",
//         data: "",
//         success: function(data) {},
//         error: function(data) {}
//     })


// })

// document.getElementById('.js_create_ratings')
// addEventListener('/ratings_create', function(е) {
//     е.preventDefault()
//     fetch('url', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json;charset=utf-8'
//             },
//             body: JSON.stringify({ 'name': 'test' })
//         })
//         .then(response => response.json())
//         .then(result => console.log(result))
// })

$(document).on('click', '.js_create_ratings', function() {
    //     var sale_manager = $(this).data("type");
    //     var manager_id = $(this).data("id");
    $.ajax({
        url: '/ratings_create',
        type: "post",
        data: "",
        success: function(data) {
            // $('.wr-btn_' + manager_id).html("");
        },
        error: function(data) {}
    });
})
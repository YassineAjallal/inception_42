var viewProduct = document.querySelector("#view-product .container");
let index = parseInt(localStorage.getItem('shoosenProduct'))


console.log(allProducts[parseInt(localStorage.getItem('shoosenProduct'))]);


viewProduct.innerHTML = `
<div class="product">
<div class="add-to">
    <div><i class="fa-solid fa-heart"></i></div>
    <div><i class="fa-solid fa-share"></i></div>
    <div><i class="fa-solid fa-eye"></i></div>
</div>
<div class="image">
    <img src="${allProducts[index].image}" alt="">
</div>
<h4 class="title">${allProducts[index].title}</h4>
<div class="note">
    <i class="fa-solid fa-star"></i>
    <i class="fa-solid fa-star"></i>
    <i class="fa-solid fa-star"></i>
    <i class="fa-solid fa-star"></i>
    <i class="fa-regular fa-star"></i>
</div>
<div class="para">
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta facilis praesentium odit voluptas illum iure libero quis fuga commodi. Autem.Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta facilis praesentium odit voluptas illum iure libero quis fuga commodi. Autem.</p>
</div>
<h4 class="price">${allProducts[index].price}<span>${allProducts[index].solde}</span></h4>
<div class="add-to-cart"><button>Add To Cart</button></div>

</div> `;



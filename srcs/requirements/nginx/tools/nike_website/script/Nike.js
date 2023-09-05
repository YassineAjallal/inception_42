let linksPhone = document.querySelector(".links-phone");
let listPhone = document.querySelector(".list-phone");
let products = document.querySelector(".products .container");
let featured = document.querySelector(".featured .container");


// show list in phone 
linksPhone.addEventListener("click", () => {
    listPhone.classList.toggle("show");
    linksPhone.classList.toggle("change-icon")
})

// show product in page
for(let i= 0 ;i<allProducts.length; i++){
    products.innerHTML += `
    <div class="product">
    <div class="add-to">
        <div><i class="fa-solid fa-heart"></i></div>
        <div><i class="fa-solid fa-share"></i></div>
        <div onclick = "viewProduct(${i})"><i class="fa-solid fa-eye"></i></div>
    </div>
    <div class="image">
        <img src="${allProducts[i].image}" alt="">
    </div>
    <h4 class="title">${allProducts[i].title}</h4>
    <h4 class="price">${allProducts[i].price}<span>${allProducts[i].solde}</span></h4>
    <div class="note">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-regular fa-star"></i>
    </div>
    <div class="add-to-cart" onclick="addProducToCart(${i})"><button>Add To Cart</button></div>
</div>
    `
}
// save in local storage 
// localStorage.setItem('product',JSON.stringify(allProducts));

// view products
function viewProduct(index){
    localStorage.setItem('shoosenProduct',index);
    window.location = 'showProduct.html';
}

// show feature products in page 

for(let i= 0 ;i<featureProducts.length; i++){
    featured.innerHTML += `
    <div class="feature">
                <div class="images">
                    <div onclick = "changeImage(this)"class="change-img">
                        <img src="${featureProducts[i].image1}" alt="">
                    </div>
                    <div onclick = "changeImage(this)" class="change-img">
                        <img src="${featureProducts[i].image2}" alt="">
                    </div>
                    <div onclick = "changeImage(this)" class="change-img">
                        <img src="${featureProducts[i].image3}" alt="">
                    </div>
                    <div onclick = "changeImage(this)" class="change-img">
                        <img src="${featureProducts[i].image4}" alt="">
                    </div>
                </div>
                <div class="big-image">
                    <img src="${featureProducts[i].image1}" alt="">
                </div>
                <div class="desc">
                    <h4 class="title">${featureProducts[i].title}</h4>
                    <div class="note">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                    </div>
                    <div class="para">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta facilis praesentium odit voluptas illum iure libero quis fuga commodi. Autem.</p>
                    </div>
                    <h4 class="price">${featureProducts[i].price}<span>${featureProducts[i].solde}</span></h4>
                
                    <div class="add-to-cart" onclick = "addProducToCart(${i})"><button>Add To Cart</button></div>
                </div>
            </div>
    `
}
// change image
function changeImage(ele) {
    let bigImage = ele.parentNode.nextElementSibling.firstElementChild;
    console.log(bigImage)
    let selectImage = ele.firstElementChild;
    console.log(selectImage.src)
    bigImage.src = selectImage.src;
}
// add to cart
let cartPF = allProducts.concat(featureProducts);
let cartProduct;
console.log(cartPF.length)

if(localStorage.getItem("cartProduct") == null){
    cartProduct = [];
}else {
    cartProduct = JSON.parse(localStorage.getItem("cartProduct"));
}

function addProducToCart (index){
    for(let i=0; i<cartProduct.length;i++){
        if(cartPF[index].id === cartProduct[i].id){
            cartProduct.splice(i,1);
        }
    }
    cartProduct.push(cartPF[index]);
    localStorage.setItem("cartProduct",JSON.stringify(cartProduct));
    showItems(index);
    showNumber();
}
// show items 
let items = document.querySelector(".items .content");
function showItems(item){
    items.innerHTML += `<div>${cartProduct[item].title}</div>`
}
window.onload = ()=>{
    for(i=0;i<cartProduct.length;i++){
        items.innerHTML += `<div>${cartProduct[i].title}</div>`
        number.innerHTML = `${cartProduct.length}`;
    }
}
let number = document.querySelector(".navbar .icons .shop .number");
console.log(number)
function showNumber (){
    number.innerHTML = `${cartProduct.length}`;
}
// show section item 
let itemsShop = document.querySelector(".items");
let shopCart = document.querySelector(".shop");
shopCart.onclick = ()=>{
    itemsShop.classList.toggle("inactive");
}



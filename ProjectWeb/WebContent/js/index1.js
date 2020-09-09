Vue.component("product", {
	template: "#product",
	props: ["product"],
	computed: {
		link: function() {
			return "/product/" + this.product.id;
		}
	}
});

Vue.component("productlist", {
	template: "#product-list",
	props: ["filter", "sort", "products"],
	methods: {
		sortProducts: function(a, b) {
			switch (this.sort) {
				case "id":
					if (Number.parseInt(a.id) < Number.parseInt(b.id)) {
						return -1;
					} else if (Number.parseInt(a.id) > Number.parseInt(b.id)) {
						return 1;
					} else {
						return 0;
					}
					break;
				case "price":
					{
						let APrice = Number.parseFloat(a.onSale ? a.salePrice : a.price);
						let BPrice = Number.parseFloat(b.onSale ? b.salePrice : b.price);
						if (APrice < BPrice) {
							return -1;
						} else if (APrice > BPrice) {
							return 1;
						} else {
							return 0;
						}
					}
					break;
				case "price-desc":
					{
						let APrice = Number.parseFloat(a.onSale ? a.salePrice : a.price);
						let BPrice = Number.parseFloat(b.onSale ? b.salePrice : b.price);
						if (APrice > BPrice) {
							return -1;
						} else if (APrice < BPrice) {
							return 1;
						} else {
							return 0;
						}
					}
					break;
				case "name":
					if (a.name.toLowerCase() < b.name.toLowerCase()) {
						return -1;
					} else if (a.name.toLowerCase() > b.name.toLowerCase()) {
						return 1;
					} else {
						return 0;
					}
					break;
				case "name-desc":
					if (a.name.toLowerCase() > b.name.toLowerCase()) {
						return -1;
					} else if (a.name.toLowerCase() < b.name.toLowerCase()) {
						return 1;
					} else {
						return 0;
					}
					break;
			}
		}
	},
	computed: {
		filteredProducts: function() {
			let resultArray = this.products.filter(product =>
				product.categories
					.map(category =>
						category
							.toLowerCase()
							.split(" ")
							.join("")
					)
					.includes(this.filter.toLowerCase())
			);
			resultArray.sort(this.sortProducts);
			return resultArray;
		}
	}
});

var vm = new Vue({
	el: "#app",
	data: {
		filter: "fruit",
		sort: "price",
		products: [
			{
				name: "Banana",
				image: "https://i5.walmartimages.ca/images/Enlarge/580/6_r/875806_R.jpg",
				price: "12.80",
				onSale: true,
				salePrice: "7.40",
				desc:
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tincidunt ex a sollicitudin. In vel porta quam, eu dictum tellus. In ornare non nisi et fermentum. Nam lacus nisl, ultricies nec mollis et, hendrerit in urna. Integer ultricies venenatis mi eu commodo.",
				id: "12",
				categories: ["Fruit", "Calcium"]
			},
			{
				name: "Orange",
				image: "https://media.buzzle.com/media/images-en/gallery/fruits/oranges/1200-187108077-orange-fruit.jpg",
				price: "7.50",
				onSale: false,
				salePrice: "7.40",
				desc:
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tincidunt ex a sollicitudin. In vel porta quam, eu dictum tellus.",
				id: "19",
				categories: ["Fruit", "Vitamin C"]
			},
			{
				name: "Apple",
				image: "https://healthjade.com/wp-content/uploads/2017/10/apple-fruit.jpg",
				price: "6.90",
				onSale: false,
				salePrice: "7.40",
				desc:
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tincidunt ex a sollicitudin. In vel porta quam, eu dictum tellus. In ornare non nisi et fermentum. Nam lacus nisl, ultricies nec mollis et, hendrerit in urna. Integer ultricies venenatis mi eu commodo. In hac habitasse platea dictumst. Nam sed nisl porta, egestas metus ac, condimentum massa. Pellentesque ac ex ut ante congue commodo.",
				id: "5",
				categories: ["Fruit"]
			},
			{
				name: "Star Fruit",
				image: "https://cdn.shopify.com/s/files/1/1717/4113/products/87b5659b82c1ac7a242020a21b81a3306bcf60e4_2048x2048.jpg?v=1526604616",
				price: "15.20",
				onSale: false,
				salePrice: "7.40",
				desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
				id: "6",
				categories: ["Fruit", "Vitamin C"]
			},
			{
				name: "Plum",
				image: "https://cdn1.woolworths.media/content/wowproductimages/large/854689.jpg",
				price: "3.30",
				onSale: false,
				salePrice: "7.40",
				desc:
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tincidunt ex a sollicitudin. In vel porta quam, eu dictum tellus. In ornare non nisi et fermentum. Nam lacus nisl, ultricies nec mollis et, hendrerit in urna. Integer ultricies venenatis mi eu commodo.",
				id: "8",
				categories: ["Fruit"]
			},
			{
				name: "Watermelon",
				image: "https://i5.walmartimages.ca/images/Large/463/3_r/6000191284633_R.jpg",
				price: "9.10",
				onSale: false,
				salePrice: "7.40",
				desc:
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tincidunt ex a sollicitudin. In vel porta quam, eu dictum tellus. In ornare non nisi et fermentum. Nam lacus nisl, ultricies nec mollis et, hendrerit in urna. Integer ultricies venenatis mi eu commodo.",
				id: "15",
				categories: ["Fruit", "Vitamin C"]
			},
			{
				name: "Generic Fruit",
				image: "https://semantic-ui.com/images/wireframe/image.png",
				price: "1.00",
				onSale: false,
				salePrice: "7.40",
				desc:
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tincidunt ex a sollicitudin. In vel porta quam, eu dictum tellus. In ornare non nisi et fermentum. Nam lacus nisl, ultricies nec mollis et, hendrerit in urna. Integer ultricies venenatis mi eu commodo. In hac habitasse platea dictumst. Nam sed nisl porta, egestas metus ac, condimentum massa.",
				id: "20",
				categories: ["Fruit", "Calcium", "Vitamin C"]
			}
		]
	}
});
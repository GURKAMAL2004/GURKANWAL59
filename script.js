
const newsContainer = document.getElementById('news-container');
const apiKey = 'abf7b8abbf454474901787d0a2d246d9';

function fetchNews() {
    fetch(`https://newsapi.org/v2/top-headlines?country=us&apiKey=${apiKey}`)
        .then(response => response.json())
        .then(data => {
            data.articles.forEach(article => {
                const articleElement = document.createElement('div');
                articleElement.innerHTML = `
                    <h2>${article.title}</h2>
                    <img src="${article.urlToImage}" alt="Article Image" style="width:100%;">
                    <p>${article.description}</p>
                    <a href="${article.url}" target="_blank">Read more</a>
                `;
                newsContainer.appendChild(articleElement);
            });
        })
        .catch(error => console.error('Error:', error));
}

document.addEventListener('DOMContentLoaded', fetchNews);

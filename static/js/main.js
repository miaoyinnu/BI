let salesChart = null;

function updateSalesAnalysis() {
    fetch('/sales-analysis')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('salesChart').getContext('2d');
            
            if (salesChart) {
                salesChart.destroy();
            }

            salesChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.categories,
                    datasets: [
                        {
                            label: 'Sales Quantity',
                            data: data.sales_quantities,
                            backgroundColor: '#2196F3',
                            order: 2,
                            yAxisID: 'quantity'
                        },
                        {
                            label: 'Price',
                            data: data.avg_prices,
                            type: 'line',
                            borderColor: '#F44336',
                            borderWidth: 2,
                            fill: false,
                            yAxisID: 'price',
                            order: 1
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        quantity: {
                            type: 'linear',
                            position: 'left',
                            title: {
                                display: true,
                                text: 'Sales Quantity'
                            },
                            beginAtZero: true
                        },
                        price: {
                            type: 'linear',
                            position: 'right',
                            title: {
                                display: true,
                                text: 'Price ($)'
                            },
                            beginAtZero: true,
                            grid: {
                                drawOnChartArea: false
                            }
                        }
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: 'Sales Quantity vs Price by Category',
                            font: {
                                size: 16
                            }
                        },
                        legend: {
                            position: 'top'
                        }
                    }
                }
            });
        });
}

document.getElementById('categoryFilter').addEventListener('change', (e) => {
    const category = e.target.value;
    updateSalesAnalysis(category);
});

document.addEventListener('DOMContentLoaded', () => {
    updateSalesAnalysis();

    const countryCtx = document.getElementById('countryPieChart').getContext('2d');
    new Chart(countryCtx, {
        type: 'pie',
        data: {
            labels: {{ country_data|map(attribute='0')|list|tojson }},
            datasets: [{
                data: {{ country_data|map(attribute='1')|list|tojson }},
                backgroundColor: ['#2196F3', '#4CAF50', '#FFC107', '#F44336', '#9C27B0']
            }]
        }
    });

    const revenueCtx = document.getElementById('revenueBarChart').getContext('2d');
    new Chart(revenueCtx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Sales Revenue',
                data: [50, 45, 40, 35, 30, 25],
                backgroundColor: '#2196F3'
            }]
        }
    });

    const yearCtx = document.getElementById('yearPieChart').getContext('2d');
    new Chart(yearCtx, {
        type: 'pie',
        data: {
            labels: {{ year_data|map(attribute='0')|list|tojson }},
            datasets: [{
                data: {{ year_data|map(attribute='1')|list|tojson }},
                backgroundColor: ['#9C27B0', '#FF5722']
            }]
        }
    });

    const productCtx = document.getElementById('productPieChart').getContext('2d');
    new Chart(productCtx, {
        type: 'pie',
        data: {
            labels: {{ product_data|map(attribute='0')|list|tojson }},
            datasets: [{
                data: {{ product_data|map(attribute='1')|list|tojson }},
                backgroundColor: ['#E91E63', '#9C27B0', '#2196F3', '#4CAF50', '#FFC107']
            }]
        }
    });
}); 
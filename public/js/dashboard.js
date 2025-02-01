function gerarGrafico(){
    const ctx2 = document.getElementById('myChart-grafico').getContext('2d');
  
    const data2 = {
      labels: [], // Rótulos do eixo Y (ranking)
      datasets: [{
        data: [], // Valores das barras
        backgroundColor: [
          '#00FF00',  // Verde
          '#33CC33',  // Verde claro
          '#66B266',  // Verde amarelado
          '#FF8000',  // Laranja
          '#FFA500'   // Laranja claro
        ],
        borderColor: [
          '#00CC00',  // Verde escuro
          '#299929',  // Verde claro escuro
          '#4C9A4C',  // Verde-amarelado escuro
          '#E67300',  // Laranja escuro
          '#E59400'   // Laranja mais escuro
        ],
        borderWidth: 1,
      }]
    };
    
    // Configurações do gráfico
    const barOptions = {
      responsive: true,
      indexAxis: 'y',
      plugins: {
        legend: {
          display: false, // Oculta a legenda do dataset
        }
      },
      scales: {
        x: {
          title: {
            display: true,
            text: 'Quantidade', // Título do eixo X
            font: {
              size: 20, // Tamanho da fonte
              family: 'Roboto', // Fonte
              weight: 'bold' // Negrito
            },
            color: 'black'
          },
          ticks: {
            font: {
                size: 18 // Tamanho da fonte
            }
        },
          beginAtZero: true // Inicia no zero
        },
        y: {
          title: { 
            display: true,

            text: 'Categoria',// Título do eixo Y
            font: {
              size: 20,
              family: 'Roboto',
              weight: 'bold'
            },
            color: 'black'
          },
          ticks: {
            font: {
              size: 12, // Tamanho da fonte dos rótulos
              family: 'Roboto',
              weight: 'bold'
            },
            color: 'black' // Cor dos rótulos
          }
        }
      }
    };
    
    // Criação do gráfico
    chart = new Chart(ctx2, {
      type: 'bar', // Tipo de gráfico
      data: data2,
      options: barOptions // Configurações do gráfico
    });
    plotarDadosDoGrafico()
  }

// adicionando gracico de rosca (alterado 31/01/25)
function gerarGrafico2(){
  const ctx2 = document.getElementById('myChart-grafico2').getContext('2d');
  
  const data2 = {
    labels: [], // Rótulos do eixo Y (ranking)
    datasets: [{
      data: [], // Valores das barras
      backgroundColor: [
        '#00FF00',  // Verde
        '#33CC33',  // Verde claro
        '#66B266',  // Verde amarelado
        '#FF8000',  // Laranja
        '#FFA500'   // Laranja claro
      ],
      borderColor: [
        '#00CC00',  // Verde escuro
        '#299929',  // Verde claro escuro
        '#4C9A4C',  // Verde-amarelado escuro
        '#E67300',  // Laranja escuro
        '#E59400'   // Laranja mais escuro
      ],
      borderWidth: 1,
    }]
  };
  
  // Configurações do gráfico
  const barOptions = {
    responsive: true,
    indexAxis: 'y',
    plugins: {
      legend: {
        display: false, // Oculta a legenda do dataset
      }
    },
    scales: {
      x: {
        title: {
          display: true,
          text: 'Quantidade', // Título do eixo X
          font: {
            size: 20, // Tamanho da fonte
            family: 'Roboto', // Fonte
            weight: 'bold' // Negrito
          },
          color: 'black'
        },
        ticks: {
          font: {
              size: 18 // Tamanho da fonte
          }
      },
        beginAtZero: true // Inicia no zero
      },
      y: {
        title: { 
          display: true,

          text: 'Categoria',// Título do eixo Y
          font: {
            size: 20,
            family: 'Roboto',
            weight: 'bold'
          },
          color: 'black'
        },
        ticks: {
          font: {
            size: 12, // Tamanho da fonte dos rótulos
            family: 'Roboto',
            weight: 'bold'
          },
          color: 'black' // Cor dos rótulos
        }
      }
    }
  };
  
  // Criação do gráfico
  chart = new Chart(ctx2, {
    type: 'bar', // Tipo de gráfico
    data: data2,
    options: barOptions // Configurações do gráfico
  });
  plotarDadosDoGrafico()
}























// const ctx3 = document.getElementById('myChart-grafico2').getContext('2d');

// const data3 = {
//   labels: [
//     'Red',
//     'Blue',
//     'Yellow'
//   ],
//   datasets: [{
//     label: 'My First Dataset',
//     data: [300, 50, 100],
//     backgroundColor: [
//       'rgb(255, 99, 132)',
//       'rgb(54, 162, 235)',
//       'rgb(255, 205, 86)'
//     ],
//     hoverOffset: 4
//   }]
// };

// // Criação do gráfico
// const chart1 = new Chart(ctx3, {
//   type: 'bar',
//   data: data3,
//   options: {
//     responsive: true,
//     maintainAspectRatio: false
// }
// });
const  filterStatisticBill = (from = false, to = false) => {
    let fromValue = "";
    let toValue = "";
    if (from && to) {
        fromValue = document.querySelector(from).value;
        toValue = document.querySelector(to).value;
    }
    var url = '/CWU/admin/dashboard';
    $.ajax({
        type: 'Post',
        url: url,
        data: {
            type: "statusBill",
            from: fromValue,
            to: toValue
        },
        dataType: 'json',
        success: function (data) {
            let resultArray = [];
            data.forEach(item => {
                const date = item.date;
                const status = item.status;
                let dateObject = resultArray.find(obj => obj.date === date);
                if (!dateObject) {
                    dateObject = {date: date, counts: {}};
                    resultArray.push(dateObject);
                }
                if (!dateObject.counts[status]) {
                    dateObject.counts[status] = 1;
                } else {
                    dateObject.counts[status]++;
                }
            });
            let morrisData = [];
            resultArray.forEach(dateObject => {
                const date = dateObject.date;
                const counts = dateObject.counts;
                let morrisItem = {y: date};
                for (let status in counts) {
                    let label = "";
                    switch (status) {
                        case "1":
                            label = "accept";
                            break;
                        case "2":
                            label = "cancel";
                            break;
                        case "3":
                            label = "deliver";
                            break;
                        case "4":
                            label = "shipping";
                            break;
                        case "5":
                            label = "finish";
                            break;
                    }
                    morrisItem[label] = counts[status];
                }
                morrisData.push(morrisItem);
            });
            if (morrisData.length == 0) {
                morrisData = [
                    {
                        y: "",
                        cancel: 0,
                        new : 0,
                        accpet: 0,
                        deliver: 0,
                        shipping: 0,
                        finish: 0
                    }
                ];
            }
            chartArea.setData(morrisData);
        },
        error: function (data) {
            console.log(data);
        }
    });
}

let chartArea = "";
const statistic = function (ele) {
    chartArea = Morris.Bar({
        element: ele,
        xkey: 'y',
        ykeys: ['cancel',  "accept", 'deliver', 'shipping', 'finish'],
        labels: ['Cancel', "Accept", 'Deliver', 'Shipping', 'Finish'],
        xLabelAngle: 60
    });
    filterStatisticBill();
}
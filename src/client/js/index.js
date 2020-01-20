var app = new Vue({
    el: '#app',
    data: {
        started: false,
        airport: undefined,
        answer: undefined,
        answerSubmitted: false,
        answerCorrect: false,
    },
    methods: {
        startGame(resource) {
            this.started = true;
            this.newAirport();
        },
        submitAnswer(resource) {
            this.answerSubmitted = true;
            this.answerCorrect = this.answer == this.airport.code;
        },
        newAirport() {
            axios
                .get('/api/airport/us/random')
                .then((response) => {
                    console.log(response);
                    this.airport = response.data.airports[0];
                });

            this.answer = undefined;
            this.answerSubmitted = false;
            this.answerCorrect = false;
        },
    }
});

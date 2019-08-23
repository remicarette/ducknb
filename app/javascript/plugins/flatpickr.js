import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


flatpickr("#range_start", {
    dateFormat: "d-m-Y",
    plugins: [new rangePlugin({ input: "#range_end"})]
});

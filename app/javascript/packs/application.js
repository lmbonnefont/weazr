
import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/material_blue.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

import { autocomplete } from '../components/autocomplete';
autocomplete();

import { loadDynamicBannerText } from '../components/banner.js';
loadDynamicBannerText();

import { isElementInViewport, callbackFunc } from '../components/timeline.js';


// var dateTomorrow = new Date();
// currentDate.setDate(currentDate.getDate() + 1);

flatpickr("#start_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#end_date"})],
  minDate: Date.now() + 86400000,
  maxDate: Date.now() + 1296000000,
});


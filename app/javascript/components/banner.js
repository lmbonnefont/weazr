import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Predict the futur of your business", "Organize your communication"],
    typeSpeed: 60,
    loop: true,
  });
}

export { loadDynamicBannerText};

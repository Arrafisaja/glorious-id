
document.addEventListener('DOMContentLoaded', () => {
  const elements = document.querySelectorAll('#catalog div');
  elements.forEach((el, i) => {
    el.style.animation = `fadeInUp 0.7s ease ${i * 0.1}s forwards`;
    el.style.opacity = 0;
  });
});

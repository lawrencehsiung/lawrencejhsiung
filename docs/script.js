// Lawrence Hsiung Bauhaus Website Interactive Controller

document.addEventListener('DOMContentLoaded', () => {
  // 1. Mobile Menu Toggle
  const toggleBtn = document.querySelector('.mobile-menu-toggle');
  const mobileMenu = document.querySelector('.mobile-menu');
  if (toggleBtn && mobileMenu) {
    toggleBtn.addEventListener('click', () => {
      mobileMenu.classList.toggle('open');
    });
  }

  // 2. Lightbox Modal
  const modal = document.getElementById('lightbox-modal');
  const modalImg = document.getElementById('modal-img');
  const modalTitle = document.getElementById('modal-title');
  const modalDesc = document.getElementById('modal-desc');
  const modalHeader = document.getElementById('modal-header-title');
  const closeBtn = document.querySelector('.modal-close-btn');

  document.querySelectorAll('.gallery-thumbnail').forEach(thumb => {
    thumb.addEventListener('click', () => {
      const src = thumb.getAttribute('data-src');
      const title = thumb.getAttribute('data-title');
      const desc = thumb.getAttribute('data-desc');
      const company = thumb.getAttribute('data-company') || 'Project Preview';

      if (modal && modalImg) {
        modalImg.src = src;
        if (modalTitle) modalTitle.textContent = title;
        if (modalDesc) modalDesc.textContent = desc;
        if (modalHeader) modalHeader.textContent = company;
        modal.classList.add('open');
      }
    });
  });

  if (closeBtn && modal) {
    closeBtn.addEventListener('click', () => modal.classList.remove('open'));
  }
  if (modal) {
    modal.addEventListener('click', (e) => {
      if (e.target === modal) modal.classList.remove('open');
    });
  }

  // 3. Portfolio Category Filtering
  const filterBtns = document.querySelectorAll('.portfolio-filter-btn');
  const projectCards = document.querySelectorAll('.project-card');

  filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      filterBtns.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      const filter = btn.getAttribute('data-filter');
      projectCards.forEach(card => {
        const cat = card.getAttribute('data-category');
        if (filter === 'all' || cat === filter) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    });
  });

  // 4. Blog Search and Category Filter
  const blogFilterBtns = document.querySelectorAll('.blog-filter-btn');
  const searchInput = document.getElementById('blog-search');
  const blogCards = document.querySelectorAll('.blog-card');
  const noEssaysMsg = document.getElementById('no-essays-msg');

  function updateBlogList() {
    const activeBtn = document.querySelector('.blog-filter-btn.active');
    const selectedCat = activeBtn ? activeBtn.getAttribute('data-filter') : 'all';
    const query = searchInput ? searchInput.value.toLowerCase().trim() : '';

    let visibleCount = 0;
    blogCards.forEach(card => {
      const cat = card.getAttribute('data-category');
      const text = card.textContent.toLowerCase();

      const matchesCat = (selectedCat === 'all' || cat === selectedCat);
      const matchesSearch = query === '' || text.includes(query);

      if (matchesCat && matchesSearch) {
        card.style.display = 'flex';
        visibleCount++;
      } else {
        card.style.display = 'none';
      }
    });

    if (noEssaysMsg) {
      noEssaysMsg.style.display = visibleCount === 0 ? 'block' : 'none';
    }
  }

  if (blogFilterBtns.length > 0) {
    blogFilterBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        blogFilterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        updateBlogList();
      });
    });
  }

  if (searchInput) {
    searchInput.addEventListener('input', updateBlogList);
  }

  // 5. Blog Article Reader Router
  const blogListSection = document.getElementById('blog-list-section');
  const blogReaderSection = document.getElementById('blog-reader-section');
  const backToBlogBtn = document.getElementById('back-to-blog-btn');

  function showArticle(articleId) {
    if (!blogListSection || !blogReaderSection) return;

    // Hide all article contents
    document.querySelectorAll('.article-content').forEach(el => el.style.display = 'none');

    const targetArticle = document.getElementById('article-' + articleId);
    if (targetArticle) {
      blogListSection.style.display = 'none';
      blogReaderSection.style.display = 'block';
      targetArticle.style.display = 'block';
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  }

  function showBlogList() {
    if (!blogListSection || !blogReaderSection) return;
    blogReaderSection.style.display = 'none';
    blogListSection.style.display = 'block';
    window.location.hash = '';
  }

  document.querySelectorAll('[data-article-id]').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      const id = btn.getAttribute('data-article-id');
      window.location.hash = 'article=' + id;
      showArticle(id);
    });
  });

  if (backToBlogBtn) {
    backToBlogBtn.addEventListener('click', (e) => {
      e.preventDefault();
      showBlogList();
    });
  }

  // Check URL Hash on Load
  if (window.location.hash.startsWith('#article=')) {
    const articleId = window.location.hash.replace('#article=', '');
    showArticle(articleId);
  }
});

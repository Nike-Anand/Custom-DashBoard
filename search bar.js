        function searchGoogle() {
            const query = document.getElementById('search-input').value;
            if (query) {
                window.location.href = `https://www.google.com/search?q=${encodeURIComponent(query)}`;
            }
        }

        // Dragging logic for the search bar
        const searchBar = document.getElementById('search-bar');
        let offsetX = 0, offsetY = 0, isDragging = false;

        searchBar.addEventListener('dragstart', (e) => {
            isDragging = true;
            offsetX = e.offsetX;
            offsetY = e.offsetY;
        });

        searchBar.addEventListener('dragend', (e) => {
            isDragging = false;
            const xPos = e.clientX - offsetX;
            const yPos = e.clientY - offsetY;

            // Move the search bar to the new position
            searchBar.style.left = `${xPos}px`;
            searchBar.style.top = `${yPos}px`;
        });

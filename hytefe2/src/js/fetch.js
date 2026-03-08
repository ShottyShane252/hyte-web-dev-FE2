/**
 * Fetches JSON data from APIs
 *
 * @param {string} url - api endpoint url
 * @param {Object} options - request options
 *
 * @returns {Object} response json data
 */
const fetchData = async (url, options = {}) => {
  try {
    const response = await fetch(url, options);

    let data;
    try {
      data = await response.json();
    } catch {
      data = null;
    }

    if (!response.ok) {
      return {
        error: data?.error || data?.message || `HTTP ${response.status} ${response.statusText}`,
      };
    }

    return data;
  } catch (error) {
    console.error('fetchData() error:', error.message);
    return { error: error.message };
  }
};

export { fetchData };

import { fetchData } from "./fetch.js";

const apiurl = 'http://localhost:3000/api';

//RENDERÖI LISTA

const renderFruitList = (items) => {
  console.log('Teen kohta listan');

  const fruitlist = document.querySelector('.fruitlist');
  fruitlist.innerHTML = '';

  console.log(items);
  items.forEach((item) => {
    console.log(item.name);
    let li = document.createElement('li');
    li.textContent = `Hedelmän id ${item.id} ja nimi ${item.name} `;
    fruitlist.appendChild(li);
  });
};

//REnderöi listaaan items

// 🔥 TAULUKON GENEROINTI

const renderItemsTable = (items) => {
  console.log('Generoidaan taulukko');

  const tbody = document.querySelector('.tbody');
  if (!tbody) {
    console.error('tbody element ei löydy');
    return;
  }

  tbody.innerHTML = '';

  items.forEach((item) => {

    const tr = document.createElement('tr');

    // NAME
    const nameTd = document.createElement('td');
    nameTd.textContent = item.name;

    // INFO BUTTON
    const infoTd = document.createElement('td');
    const infoBtn = document.createElement('button');
    infoBtn.textContent = 'Info';
    infoBtn.classList.add('check');
    infoBtn.dataset.id = item.id;
    infoTd.appendChild(infoBtn);

    // DELETE BUTTON
    const deleteTd = document.createElement('td');
    const deleteBtn = document.createElement('button');
    deleteBtn.textContent = 'Delete';
    deleteBtn.classList.add('del');
    deleteBtn.dataset.id = item.id;
    deleteTd.appendChild(deleteBtn);

    // ID
    const idTd = document.createElement('td');
    idTd.textContent = item.id;

    tr.appendChild(nameTd);
    tr.appendChild(infoTd);
    tr.appendChild(deleteTd);
    tr.appendChild(idTd);

    tbody.appendChild(tr);
  });
};


// GET items
const getItems = async () => {
  const items = await fetchData(`${apiurl}/items`);

  // jos BE puolelta tulee virhe niin informoidaan
  // joko consoleen tai käyttäjälle virheestä

  if (items.error) {
    console.log(items.error);
    return;
  }

  // tai jatketaan jä tehdään datalle jotain
  // items.forEach((item) => {
  //   console.log(item.name);
  // });

  renderFruitList(items);
  renderItemsTable(items);
};

// GET itemsbyid
////////////////

const getItemById = async (event) => {
  console.log('Haetaan id:llä');

  event.preventDefault();

  const idInput = document.querySelector('#itemId');
const itemId = idInput.value;
console.log(itemId);

  const url =(`${apiurl}/items/${itemId}`);

  const options = {
    method: 'GET',
  };
  const items = await fetchData(url,options);

  // jos BE puolelta tulee virhe niin informoidaan
  // joko consoleen tai käyttäjälle virheestä

  if (items.error) {
    console.log(items.error);
    return;
  }
  //1.developer tool
  console.log(items);
//2.Käyttäjälle alert
  alert(`Item found: ${items.name} ID: ${items.id}`);
};

//DELETE item

const deleteItemById = async (event) => {
  console.log('Poistetaan id:llä');

  event.preventDefault();

  const idInput = document.querySelector('#itemId');
const itemId = idInput.value;
console.log(itemId);

//MUista tarkistaa että käyttäjä lähettää oikean datan
if(!itemId) {console.log('ID puuttuu täytäthän tiedot');
  return;}

const confirmed = confirm(`Haluatko varmasti poistaa itemin ID: ${itemId}?`
);
if (!confirmed) {
  return;
}

const url =(`${apiurl}/items/${itemId}`);

  const options = {
    method: 'DELETE',
  };
  const items = await fetchData(url,options);

  // jos BE puolelta tulee virhe niin informoidaan
  // joko consoleen tai käyttäjälle virheestä

  if (items.error) {
    console.log(items.error);
    return;
  }
  //1.developer tool
  console.log(items);
//2.Käyttäjälle alert
  alert(`Item deleted: ${items.name} ID: ${items.id}`);


//3.Päivitetään UI niin että käyttäjä tietoää että hedelmä poistui listasta
await getItems();

};

//POST item (ADD)

const addItem = async (event) => {
  console.log('Lisätään uusi item');

  event.preventDefault();

  const form = document.querySelector('.add-item-form');
  const fruitName = document.querySelector('#newItemName').value.trim();
  const fruitWeight = document.querySelector('#newItemWeight').value.trim();

if (!fruitName) {
  alert('Nimi puuttuu täytäthän tiedot');
  return;
}

const body = {
  name: fruitName,
  weight: fruitWeight
};

  const url =(`${apiurl}/items/`);

  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(
      {
        name:fruitName,
        weight: fruitWeight,
      }
    )
  };

  const response = await fetchData(url,options);

  // jos BE puolelta tulee virhe niin informoidaan
  // joko consoleen tai käyttäjälle virheestä

  if (response.error) {
    console.log(response.error);
    return;
  }
  //1.developer tool
  console.log(response);
//2.Käyttäjälle alert
  alert(`Item added: ${fruitName}`);
};

// 🔥 TABLE BUTTON EVENT LISTENER

document.addEventListener('click', async (event) => {

  if (event.target.classList.contains('check')) {
    const id = event.target.dataset.id;
    alert(`Info item ID: ${id}`);
  }

  if (event.target.classList.contains('del')) {
    const id = event.target.dataset.id;
    await fetchData(`${apiurl}/items/${id}`, {
      method: 'DELETE'
    });
    await getItems();
  }

});

export { getItems,getItemById, deleteItemById,addItem };










// GET items
/*
const getItems = async () => {
  try {
    const items = await fetchData(`${apiurl}/items`);

    if (items.error) {
      console.error(items.error);
      return;
    }

    items.forEach((item) => {
      console.log(item.name);
    });

    renderFruitList(items);
  } catch (err) {
    console.error('Error fetching items:', err);
  }
};*/


/* GET item by id

const getItemById = async () => {
  try {
    const items = await fetchData(`${apiurl}/items`);

    if (items.error) {
      console.error(items.error);
      return;
    }

    items.forEach((item) => {
      console.log(item.name);
    });

    renderFruitList(items);
  } catch (err) {
    console.error('Error fetching items:', err);
  }
};*/


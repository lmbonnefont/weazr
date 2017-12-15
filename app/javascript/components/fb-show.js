function one() {
  const title = document.getElementById('campaign_title');
  if (title != null) {
    title.addEventListener("blur", (event) => {
      var title_val = document.getElementById('campaign_title').value;
      document.getElementById('fb-show-title').innerHTML = title_val;
    });
  }


  const post_title = document.getElementById('campaign_post_title');
  if (post_title != null) {
    post_title.addEventListener("blur", (event) => {
      var post_title_val = document.getElementById('campaign_post_title').value;
      document.getElementById('title-pic-fb').innerHTML = post_title_val;
    });
  }


  const post_msg = document.getElementById('campaign_post_msg');
  if (post_msg != null) {
    post_msg.addEventListener("blur", (event) => {
      var post_msg_val = document.getElementById('campaign_post_msg').value;
      document.getElementById('content-pic-fb').innerHTML = post_msg_val;
    });
  }


}

export { one };

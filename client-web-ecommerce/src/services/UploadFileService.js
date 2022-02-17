

class UploadFilesService {
  upload(file,product, onUploadProgress) {
    let formData = new FormData();

    formData.append("file", file);
    formData.append('product', product)
    return 
  
  }

  getFiles() {
    return {};
  }
}

export default new UploadFilesService();



class UploadFilesService {
  upload(file, onUploadProgress) {
    let formData = new FormData();

    formData.append("file", file);

  
  }

  getFiles() {
    return {};
  }
}

export default new UploadFilesService();

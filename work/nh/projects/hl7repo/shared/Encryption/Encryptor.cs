using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Shared.Encryption
{
    public class Encryptor
    {
        private byte[] Key;
        public Encryptor(){}

        public string Encrypt(string input)
        {
            if (Key == null || Key.Length == 0) throw new Exception("Encryption Key is null or empty");
            try
            {
                byte[] inputbyteArray = Encoding.UTF8.GetBytes(input);
                string output = "";

                using (var aes = Aes.Create())
                {
                    aes.Mode = CipherMode.CBC;
                    aes.Padding = PaddingMode.PKCS7;
                    aes.GenerateIV();
                    using (var ms = new MemoryStream())
                    {
                        using (var cs = new CryptoStream(ms, aes.CreateEncryptor(Key, aes.IV), CryptoStreamMode.Write))
                        {
                            ms.Write(aes.IV);
                            cs.Write(inputbyteArray);
                            cs.FlushFinalBlock();
                        }
                        output = Convert.ToBase64String(ms.ToArray());
                    }
                }
                return output;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public string Decrypt(string input)
        {
            if (Key == null || Key.Length == 0) throw new Exception("Encryption Key is null or empty");
            try
            {
                var inputBytes = Convert.FromBase64String(input);
                string output = string.Empty;

                using (var aes = Aes.Create())
                {
                    using (var ms = new MemoryStream(inputBytes))
                    {
                        var iv = new byte[16];
                        ms.Read(iv, 0, 16);
                        using (var cs = new CryptoStream(ms, aes.CreateDecryptor(Key, iv), CryptoStreamMode.Read))
                        {
                            using (var sr = new StreamReader(cs))
                            {
                                output = sr.ReadToEnd();
                            }
                        }
                    }
                }
                return output;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
        public void SetEncryptionKey(string keyString){
            Key = Encoding.UTF8.GetBytes(keyString);
        }
    }
}
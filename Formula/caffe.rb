class Caffe < Formula
  desc "Fast open framework for deep learning"
  homepage "http://caffe.berkeleyvision.org/"
  url "https://github.com/BVLC/caffe/archive/1.0.0-rc4.tar.gz"
  version "1.0.0-rc4"
  sha256 "1e186286f820cfd720c1e4eda3ba028ec6ff3b0018fac568f06d17d0d7b72b4e"
  head "https://github.com/BVLC/caffe.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "gflags"
  depends_on "glog"
  depends_on "homebrew/science/hdf5"
  depends_on "homebrew/science/opencv"
  depends_on "ilovezfs/caffe/boost-python157"
  depends_on "homebrew/versions/boost157"
  depends_on "leveldb"
  depends_on "lmdb"
  depends_on "protobuf"
  depends_on "snappy"
  depends_on "szip"

  def install
    boost_python = Formula["boost-python157"].opt_lib/"libboost_python-mt.dylib"
    system "cmake", ".", "-DBoost_PYTHON_LIBRARY_RELEASE=#{boost_python}",
                         *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"caffe", "-version"
  end
end
